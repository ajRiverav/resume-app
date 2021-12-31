//
//  SectionHeaderCell.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation
import UIKit

class SectionHeaderCell: UITableViewCell {
    @IBOutlet private weak var startDate: UILabel!
    @IBOutlet private weak var endDate: UILabel!
    @IBOutlet private weak var dateSeparator: UILabel!
    @IBOutlet private weak var title: UILabel!

    public var viewModel = ViewModel() {
      didSet {

        startDate.text = viewModel.startDate
        endDate.text = viewModel.endDate ?? ""
        dateSeparator.text = viewModel.dateSeparator ?? "-"
        title.text = viewModel.title
      }
    }
}

extension SectionHeaderCell {
  struct ViewModel {
      var startDate: String = ""// TODO: make a Date instead
      var endDate: String?      // TODO: make a Date instead
      var dateSeparator: String?
      var title: String = ""
  }
}

extension SectionHeaderCell.ViewModel {
    init(_ experience: Experience) {

        self.init(startDate: experience.dates.start.formatted(as: .yyyy),
                  endDate: experience.dates.end?.formatted(as: .yyyy),
                  dateSeparator: "-", title: experience.place.name)
    }
}
