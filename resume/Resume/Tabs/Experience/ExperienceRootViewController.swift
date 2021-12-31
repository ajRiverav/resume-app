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
        // Register cells to be used in this table so they can be dequeued later.
        [
          SectionHeaderCell.self,
          ExperienceSectionRowCell.self
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

extension ExperienceRootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

// MARK: - UITableViewDataSource

extension ExperienceRootViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        experiences.count
    }

    func tableView(_: UITableView, numberOfRowsInSection experienceIndex: Int) -> Int {
        experiences[experienceIndex].description.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let experience = experiences[indexPath.section]

        switch indexPath.row {
        case 0:
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ExperienceSectionRowCell.self)",
                                                     for: indexPath) as! ExperienceSectionRowCell

            cell.viewModel = .init(icon: Icon.pin.image,
                                   title: "\(experience.place.address.city.displayString), \(experience.place.address.state.displayString)")

            return cell
        case 1:
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ExperienceSectionRowCell.self)",
                                                     for: indexPath) as! ExperienceSectionRowCell
            cell.viewModel = .init(icon: Icon.organigram.image, title: experience.position)

            return cell

        default:

            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension ExperienceRootViewController: UITableViewDelegate {
    // Setting Header Customised View
    func tableView(_ tableView: UITableView, viewForHeaderInSection experienceIndex: Int) -> UIView? {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SectionHeaderCell.self)") as! SectionHeaderCell

        cell.viewModel = .init(experiences[experienceIndex])

        return cell.contentView
    }
}
