//
//  EducationTableViewDataSource.swift
//  Resume
//
//  Created by AJ Rivera on 1/8/22.
//

import Foundation
import UIKit

/// Handles data sourcing an education table view
class EducationTableViewDataSource: NSObject {
    private let organizer: DataOrganizer

    init(educationList: [Education]) {
        organizer = DataOrganizer(educationList: educationList)
    }

    public func sectionHeader(at index: Int) -> EducationViewController.Section.HeaderType {
        return organizer.sectionHeaderType(at: index)
    }

    public func sectionRow(at indexPath: IndexPath) -> EducationViewController.Section.RowType {
        return organizer.sectionRowType(at: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension EducationTableViewDataSource: UITableViewDataSource {
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
        case .college(let education):
            if let configurableCell = cell as? EducationDetailsConfigurable {
                configurableCell.configureWith(education: education,
                                               detailType: sectionRowType,
                                               detailIndex: indexPath.row)
            }
        }

        return cell ?? UITableViewCell()
    }
}

// MARK: - Data organizer

extension EducationTableViewDataSource {
    // How can we neatly specify and organize different cell types? This is what the organizer is for.
    struct DataOrganizer {
        /// organized data takes the form of sections. Each section
        /// contains a header and possibly rows.
        private var sectionList: [EducationViewController.Section]

        public var sectionListCount: Int {
            return sectionList.count
        }

        init(educationList: [Education]) {
            sectionList = [EducationViewController.Section]()

            for education in educationList {
                // TODO: do not assume all educations are college
                let header = EducationViewController.Section.HeaderType.college(education)

                var rows = [EducationViewController.Section.RowType]()
                rows.append(.degree)
                rows.append(.location)
                _ = education.emphasistList.map {_ in rows.append(.highlight)}

                sectionList.append(EducationViewController.Section.education(header, rows))
            }
        }

        public func sectionHeaderType(at index: Int) -> EducationViewController.Section.HeaderType {
            return sectionList[index].section.0
        }

        public func sectionRowType(at indexPath: IndexPath) -> EducationViewController.Section.RowType {
            return sectionList[indexPath.section].section.1[indexPath.row]
        }

        public func sectionRowCount(for index: Int) -> Int {
            return sectionList[index].section.1.count
        }
    }
}
