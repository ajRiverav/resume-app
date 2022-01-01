//
//  ExperienceSectionRowCell.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation
import UIKit

class SectionRowCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var iconLabel: UILabel!

    public var viewModel = ViewModel() {
      didSet {
          iconImageView.isHidden = (viewModel.icon == nil)

          iconImageView.image = viewModel.icon
          iconLabel.text = viewModel.title
      }
    }
}

extension SectionRowCell {
  struct ViewModel {
      var icon: UIImage?
      var title: String = ""
  }
}
