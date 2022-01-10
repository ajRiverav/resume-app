//
//  SummaryCoordinator.swift
//  Resume
//
//  Created by AJ Rivera on 1/8/22.
//

import Foundation
import UIKit

protocol SummaryCoordinated: AnyObject {
    var summaryCoordinator: SummaryCoordinator? { get set }
}

class SummaryCoordinator {
    weak var parent: Coordinator?
}

// MARK: - Coordinator
extension SummaryCoordinator: Coordinator {
    func configure(viewController: UIViewController) {
        parent?.configure(viewController: viewController)
    }
}

extension SummaryCoordinator {
    public func didSelectRow(_ viewController: SummaryViewController, tableView: UITableView, indexPath: IndexPath) {
        guard let dataSource = tableView.dataSource as? SummaryTableViewDataSource
        else { assertionFailure("nil value"); return }

        switch dataSource.sectionHeader(at: indexPath.section) {
        case .dateful(let highlight), .dateless(let highlight):
            guard let urlString = highlight.emphasisList[indexPath.row].webLink?.urlAsString,
                    let url = URL(string: urlString)
            else { return }
            UIApplication.shared.open(url, options: [:])
        }
    }
}
