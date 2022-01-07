//
//  SummaryViewController.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewDataSource: SummaryTableViewDataSource?
}

// MARK: - Methods

extension SummaryViewController {
    func configureTableView() {
        tableView.setBackgroundColor()
        // Separation of concerns: data source
        let tableViewDataSource = SummaryTableViewDataSource()
        self.tableViewDataSource = tableViewDataSource
        tableView.dataSource = tableViewDataSource

        tableView.delegate = self

        tableView.reloadData()
    }
}

extension SummaryViewController: UITableViewDelegate {

}
