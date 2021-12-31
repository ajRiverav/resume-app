//
//  ExperienceSectionRowCell.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation
import UIKit

class ExperienceSectionRowCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var iconLabel: UILabel!

    public var viewModel = ViewModel() {
      didSet {
          iconImageView.image = viewModel.icon
          iconLabel.text = viewModel.title
      }
    }
}

extension ExperienceSectionRowCell {
  struct ViewModel {
      var icon: UIImage?
      var title: String = ""
  }
}
