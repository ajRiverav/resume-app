//
//  EducationRootViewController.swift
//  Resume
//
//  Created by AJ Rivera on 1/1/22.
//

import Foundation
import UIKit

class EducationViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewDataSource: EducationTableViewDataSource?
}

// MARK: - UIViewController

extension EducationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar(title: "education".localized)
        configureTableView()
    }
}

// MARK: - Methods

extension EducationViewController {
    func configureTableView() {
        tableView.setBackgroundColor()
        tableView.backgroundColor = .antiFlashWhite

        // Register cells to be used in this table so they can be dequeued later.
        [
          SectionHeaderCell.self,
          SectionRowCell.self
        ].forEach {
          tableView.register(UINib(nibName: "\($0)", bundle: nil),
                             forCellReuseIdentifier: "\($0)")
        }

        // Separation of concerns: data source
        let tableViewDataSource = EducationTableViewDataSource(educationList: educationList)
        self.tableViewDataSource = tableViewDataSource
        tableView.dataSource = tableViewDataSource

        tableView.delegate = self
    }
}

// MARK: - Section
/// Define the building blocks for this vc's table view data source. The actual structure/order will
/// be defined in the data source.
extension EducationViewController {
    // VC can have multiple section types. For now, only 1 exists.
    enum Section {
        case education(HeaderType, [RowType])

        /// Returns the section header and section rows.
        var section: (HeaderType, [RowType]) {
            switch self {
            case let .education(header, rows): return (header, rows)
            }
        }
    }
}

extension EducationViewController.Section {
    enum HeaderType: CellTypeful {
        case college(Education)

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .college: return SectionHeaderCell.self
            }
        }
    }

    enum RowType: CellTypeful {
        case degree
        case location
        case highlight

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .degree, .location, .highlight: return SectionRowCell.self
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension EducationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        // Get section header
        guard let sectionHeaderType = tableViewDataSource?.sectionHeader(at: sectionIndex),
              let cell =  tableView.dequeueReusableCell(withIdentifier: String(describing: sectionHeaderType.cellType.self))
        else {
            assertionFailure("nil value")
            return UIView()
        }

        switch sectionHeaderType {
        case .college(let education):
            if let configurableCell = cell as? EducationConfigurable {
                configurableCell.configureWith(education: education)
            }
        }

        return cell.contentView
    }
}
