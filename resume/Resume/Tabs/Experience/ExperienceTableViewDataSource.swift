//
//  ExperienceDataSource.swift
//  Resume
//
//  Created by AJ Rivera on 1/3/22.
//

import Foundation
import UIKit

/// Handles data sourcing an experience table view
class ExperienceTableViewDataSource: NSObject {
    private let organizer: DataOrganizer

    init(experienceList: [Experience]) {
        organizer = DataOrganizer(experienceList: experienceList)
    }

    public func sectionHeader(at index: Int) -> ExperienceViewController.Section.HeaderType {
        return organizer.sectionHeaderType(at: index)
    }

    public func sectionRow(at indexPath: IndexPath) -> ExperienceViewController.Section.RowType {
        return organizer.sectionRowType(at: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension ExperienceTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return organizer.sectionListCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizer.sectionRowCount(for: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get section header and section row.
        let sectionHeaderType = organizer.sectionHeaderType(at: indexPath.section)
        let sectionRowType = organizer.sectionRowType(at: indexPath)

        let cell =  tableView.dequeueReusableCell(withIdentifier: String(describing: sectionRowType.cellType.self))

        switch sectionHeaderType {
        case .job(let experience), .extracurricular(let experience):
            if let configurableCell = cell as? ExperienceDetailsConfigurable {
                configurableCell.configureWith(experience: experience,
                                               detailType: sectionRowType,
                                               detailIndex: indexPath.row)
            }
        }

        return cell ?? UITableViewCell()
    }
}

// MARK: - Data organizer

extension ExperienceTableViewDataSource {
    // How can we neatly specify and organize different cell types? This is what the organizer is for.
    struct DataOrganizer {
        /// organized data takes the form of sections. Each section
        /// contains a header and possibly rows.
        private var sectionList: [ExperienceViewController.Section]

        public var sectionListCount: Int {
            return sectionList.count
        }

        init(experienceList: [Experience]) {
            sectionList = [ExperienceViewController.Section]()

            for experience in experienceList {
                // TODO: do not assume all experiences are job experiences.
                let header = ExperienceViewController.Section.HeaderType.job(experience)

                var rows = [ExperienceViewController.Section.RowType]()
                rows.append(.location)
                rows.append(.position)
                _ = experience.noteList.map {_ in rows.append(.note)}

                sectionList.append(ExperienceViewController.Section.experience(header, rows))
            }
        }

        public func sectionHeaderType(at index: Int) -> ExperienceViewController.Section.HeaderType {
            return sectionList[index].section.0
        }

        public func sectionRowType(at indexPath: IndexPath) -> ExperienceViewController.Section.RowType {
            return sectionList[indexPath.section].section.1[indexPath.row]
        }

        public func sectionRowCount(for index: Int) -> Int {
            return sectionList[index].section.1.count
        }
    }
}
