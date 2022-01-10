//
//  SummaryTableViewDataSource.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import UIKit

/// Handles data sourcing a summary  table view
class SummaryTableViewDataSource: NSObject {
    private let organizer: DataOrganizer

    init(highlightList: [Highlight]) {
        organizer = DataOrganizer(highlightList: highlightList)
    }

    public func sectionHeader(at index: Int) -> SummaryViewController.Section.HeaderType {
        return organizer.sectionHeaderType(at: index)
    }

    public func sectionRow(at indexPath: IndexPath) -> SummaryViewController.Section.RowType {
        return organizer.sectionRowType(at: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension SummaryTableViewDataSource: UITableViewDataSource {
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
        case .dateless(let highlight), .dateful(let highlight):
            if let configurableCell = cell as? HighlightDetailsConfigurable {
                configurableCell.configureWith(highlightDetail: highlight.emphasisList[indexPath.row].title,
                                               detailType: .summary)
            }
        }

        return cell ?? UITableViewCell()
    }
}

extension SummaryTableViewDataSource {
    struct DataOrganizer {
        private var sectionList: [SummaryViewController.Section]

        public var sectionListCount: Int {
            return sectionList.count
        }

        init(highlightList: [Highlight]) {
            sectionList = [SummaryViewController.Section]()

            for highlight in highlightList {
                // TODO: do not assume all highlights are dateless
                let header = SummaryViewController.Section.HeaderType.dateless(highlight)

                var rows = [SummaryViewController.Section.RowType]()
                _ = highlight.emphasisList.map {_ in rows.append(.summary)}

                sectionList.append(SummaryViewController.Section.highlight(header, rows))
            }
        }

        public func sectionHeaderType(at index: Int) -> SummaryViewController.Section.HeaderType {
            return sectionList[index].section.0
        }

        public func sectionRowType(at indexPath: IndexPath) -> SummaryViewController.Section.RowType {
            return sectionList[indexPath.section].section.1[indexPath.row]
        }

        public func sectionRowCount(for index: Int) -> Int {
            return sectionList[index].section.1.count
        }
    }
}
