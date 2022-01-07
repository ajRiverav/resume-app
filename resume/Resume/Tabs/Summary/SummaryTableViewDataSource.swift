//
//  SummaryTableViewDataSource.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import UIKit

/// Handles data sourcing a summary  table view
class SummaryTableViewDataSource: NSObject {
}

extension SummaryTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
