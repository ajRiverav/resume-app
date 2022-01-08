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

    // every education has a X (e.g. X) AND X (X).
    let tableViewSectionRowOffset = 2

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

        // This view controller handles all about the table view.
        // TODO: move data source somewhere else for less responsibilities.
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UIViewController

extension EducationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

// MARK: - UITableViewDataSource

extension EducationViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        educationList.count
    }

    func tableView(_: UITableView, numberOfRowsInSection educationIndex: Int) -> Int {
        tableViewSectionRowOffset + educationList[educationIndex].highlightList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let education = educationList[indexPath.section]

        // TODO: too many responsibilities here. Probably it makes sense to create a class for the data source.
        switch indexPath.row {
        case 0:
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionRowCell.self)",
                                                     for: indexPath) as! SectionRowCell

            cell.viewModel = .init(icon: Icon.pin.image,
                                   title: "\(education.place.address.city.displayString), \(education.place.address.state.displayString)")

            return cell
        case 1:
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionRowCell.self)",
                                                     for: indexPath) as! SectionRowCell
            cell.viewModel = .init(icon: Icon.diploma.image, title: education.degree)
            return cell

        default:
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionRowCell.self)",
                                                     for: indexPath) as! SectionRowCell
            cell.viewModel = .init(icon: Icon.chevronRight.image, title: education.highlightList[indexPath.row - tableViewSectionRowOffset])
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension EducationViewController: UITableViewDelegate {
    // Setting Header Customised View
    func tableView(_ tableView: UITableView, viewForHeaderInSection educationIndex: Int) -> UIView? {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionHeaderCell.self)") as! SectionHeaderCell

        cell.viewModel = .init(educationList[educationIndex])

        return cell.contentView
    }
}
