//
//  SectionHeaderCell.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation
import UIKit

class SectionHeaderCell: UITableViewCell {
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var dateSeparator: UILabel!
    @IBOutlet weak var title: UILabel!

    public var viewModel = ViewModel() {
      didSet {
        startDate.text = viewModel.startDate
        endDate.text = viewModel.endDate
        dateSeparator.text = viewModel.dateSeparator
        title.text = viewModel.title
      }
    }
}

// TODO: create view model for the view in this cell
extension SectionHeaderCell {
  struct ViewModel {
      var startDate: String = ""// TODO: make a Date instead
      var endDate: String = ""// TODO: make a Date instead
      var dateSeparator: String = "-"
      var title: String = ""
  }
}
