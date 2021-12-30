//
//  ExperienceRootViewController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class ExperienceRootViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
}

// MARK: - Methods

extension ExperienceRootViewController {
    func configureTableView() {
        // Register cell for later use.
        tableView.register(UINib(nibName: "\(SectionHeaderCell.self)", bundle: nil),
                           forCellReuseIdentifier: "\(SectionHeaderCell.self)")

        // This view controller handles all about the table view.
        // TODO: move data source somewhere else for less responsibilities.
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UIViewController

extension ExperienceRootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

// MARK: - UITableViewDataSource

extension ExperienceRootViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        2 // TODO: number of experiences.
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        4 // TODO: each experience has 4 notes
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionHeaderCell.self)",
                                                 for: indexPath) as! SectionHeaderCell

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ExperienceRootViewController: UITableViewDelegate {
    // Setting Header Customised View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionHeaderCell.self)") as! SectionHeaderCell

        cell.viewModel = .init(startDate: "2018", endDate: "2019", dateSeparator: "-", title: "Test")

        return cell.contentView
    }
}
