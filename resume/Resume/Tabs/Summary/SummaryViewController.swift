//
//  SummaryViewController.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController, SummaryCoordinated {
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewDataSource: SummaryTableViewDataSource?

    // Implementation
    weak var summaryCoordinator: SummaryCoordinator?

}

// MARK: - UIViewController

extension SummaryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar(title: "AJ Rivera's Resume".localized)
        configureTableView()
    }
}

// MARK: - Methods

extension SummaryViewController {
    func configureTableView() {
        tableView.setBackgroundColor()

        [
            HighlightSectionHeaderCell.self,
            SectionRowCell.self
        ].forEach {
            tableView.register(UINib(nibName: "\($0)", bundle: nil),
                               forCellReuseIdentifier: "\($0)")
        }

        // Separation of concerns: data source
        let tableViewDataSource = SummaryTableViewDataSource(highlightList: highlightList)
        self.tableViewDataSource = tableViewDataSource
        tableView.dataSource = tableViewDataSource

        tableView.delegate = self
    }
}

// MARK: - UITableViewDelegate

extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        // Get section header
        guard let sectionHeaderType = tableViewDataSource?.sectionHeader(at: sectionIndex),
              let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: sectionHeaderType.cellType.self))
        else {
            assertionFailure("nil value")
            return UIView()
        }

        switch sectionHeaderType {
        case .dateless(let highlight), .dateful(let highlight):

            if let configurableCell = cell as? HighlightConfigurable {
                configurableCell.configureWith(highlight: highlight)
            }
        }

        return cell.contentView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        summaryCoordinator?.didSelectRow(self, tableView: tableView, indexPath: indexPath)
    }
}

// MARK: - Section
/// Define the building blocks for this vc's table view data source. The actual structure/order will
/// be defined in the data source.
extension SummaryViewController {
    // VC can have multiple section types. For now, only 1 exists.
    enum Section {
        case highlight(HeaderType, [RowType])

        /// Returns the section header and section rows.
        var section: (HeaderType, [RowType]) {
            switch self {
            case let .highlight(header, rows): return (header, rows)
            }
        }
    }

}

extension SummaryViewController.Section {
    enum HeaderType: CellTypeful {
        case dateless(Highlight)
        case dateful(Highlight)

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .dateless, .dateful: return HighlightSectionHeaderCell.self
            }
        }

    }

    enum RowType: CellTypeful {
        case summary
        case link

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .summary: return SectionRowCell.self
            case .link: return LinkCell.self
            }
        }
    }
}
