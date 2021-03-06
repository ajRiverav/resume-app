//
//  ExperienceRootViewController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController, ExperienceCoordinated {
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewDataSource: ExperienceTableViewDataSource?

    // Implementation
    weak var experienceCoordinator: ExperienceCoordinator?
}

// MARK: - UIViewController

extension ExperienceViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar(title: "experience".localized)
        configureTableView()
    }
}

// MARK: - Methods

extension ExperienceViewController {
    func configureTableView() {
        tableView.setBackgroundColor()

        // Register cells to be used in this table so they can be dequeued later.
        [
            SectionHeaderCell.self,
            SectionRowCell.self
        ].forEach {
            tableView.register(UINib(nibName: "\($0)", bundle: nil),
                               forCellReuseIdentifier: "\($0)")
        }

        // Separation of concerns: data source
        let tableViewDataSource = ExperienceTableViewDataSource(experienceList: experienceList)
        self.tableViewDataSource = tableViewDataSource
        tableView.dataSource = tableViewDataSource

        tableView.delegate = self
    }
}

// MARK: - UITableViewDelegate

extension ExperienceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        // Get section header
        guard let sectionHeaderType = tableViewDataSource?.sectionHeader(at: sectionIndex),
              let cell =  tableView.dequeueReusableCell(withIdentifier: String(describing: sectionHeaderType.cellType.self))
        else {
            assertionFailure("nil value")
            return UIView()
        }

        switch sectionHeaderType {
        case .job(let experience), .extracurricular(let experience):
            if let configurableCell = cell as? ExperienceConfigurable {
                configurableCell.configureWith(experience: experience)
            }
        }

        return cell.contentView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        experienceCoordinator?.didSelectRow(self, tableView: tableView, indexPath: indexPath)
    }
}

// MARK: - Section
/// Define the building blocks for this vc's table view data source. The actual structure/order will
/// be defined in the data source.
extension ExperienceViewController {
    // VC can have multiple section types. For now, only 1 exists.
    enum Section {
        case experience(HeaderType, [RowType])

        /// Returns the section header and section rows.
        var section: (HeaderType, [RowType]) {
            switch self {
            case let .experience(header, rows): return (header, rows)
            }
        }
    }
}

extension ExperienceViewController.Section {
    enum HeaderType: CellTypeful {
        case job(Experience)
        case extracurricular(Experience)

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .job, .extracurricular: return SectionHeaderCell.self
            }
        }
    }

    enum RowType: CellTypeful {
        case location
        case position
        case emphasis

        // Implementation
        var cellType: UITableViewCell.Type {
            switch self {
            case .location, .position, .emphasis: return SectionRowCell.self
            }
        }
    }
}

/// Has a cell type.
/// Every row type must return its cell type.
protocol CellTypeful {
    var cellType: UITableViewCell.Type { get }
}
