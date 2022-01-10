//
//  ExperienceCoordinator.swift
//  Resume
//
//  Created by AJ Rivera on 1/9/22.
//

import Foundation
import UIKit

protocol ExperienceCoordinated: AnyObject {
    var experienceCoordinator: ExperienceCoordinator? { get set }
}

// MARK: - SummaryCoordinator

class ExperienceCoordinator {
    weak var parent: Coordinator?
}

// MARK: - Coordinator
extension ExperienceCoordinator: Coordinator {
    func configure(viewController: UIViewController) {
        parent?.configure(viewController: viewController)
    }
}

extension ExperienceCoordinator {
    public func didSelectRow(_ viewController: ExperienceViewController, tableView: UITableView, indexPath: IndexPath) {

        guard let dataSource = tableView.dataSource as? ExperienceTableViewDataSource
        else { assertionFailure("nil value"); return }

        let sectionHeaderType = dataSource.sectionHeader(at: indexPath.section)
        let sectionRowType = dataSource.sectionRow(at: indexPath)

        switch sectionHeaderType {
        case .job(let experience), .extracurricular(let experience):
            switch sectionRowType {
            case .emphasis:
                // Ugh. Figure out how to fix the -2.
                guard let urlString = experience.emphasisList[indexPath.row-2].link?.urlAsString,
                      let url = URL(string: urlString)
                else { return }

                UIApplication.shared.open(url, options: [:])

            default: return
            }
        }
    }
}
