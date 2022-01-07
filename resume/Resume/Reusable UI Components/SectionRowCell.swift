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
          iconLabel.textColor = viewModel.textColor
          contentView.backgroundColor = viewModel.backgroundColor
          iconLabel.font = UIFont(name: iconLabel.font.fontName, size: viewModel.fontSize)
      }
    }
}

extension SectionRowCell {
  struct ViewModel {
      var icon: UIImage?
      var title: String = ""
      var textColor: UIColor = .chineseBlack
      var backgroundColor: UIColor = .antiFlashWhite
      var fontSize: CGFloat = 17
  }
}

extension SectionRowCell.ViewModel {
    init(icon: UIImage, title: String, fontSize: CGFloat) {
        self.icon = icon
        self.title = title
        self.fontSize = fontSize
    }
}

protocol ExperienceDetailsConfigurable {
    func configureWith(experience: Experience, detailType: ExperienceViewController.Section.RowType, detailIndex: Int)
}

extension SectionRowCell: ExperienceDetailsConfigurable {
    func configureWith(experience: Experience, detailType: ExperienceViewController.Section.RowType, detailIndex: Int) {
        switch detailType {
        case .location:
            viewModel = .init(icon: Icon.pin.image,
                              title: "\(experience.place.address.city.displayString), \(experience.place.address.state.displayString)")
        case .position:
            viewModel = .init(icon: Icon.groupOfPeople.image, title: experience.position)
        case .note:
            // TODO: Uuugh. Fix this -2 thing.
            viewModel = .init(icon: Icon.chevronRight.image,
                              title: experience.noteList[detailIndex-2],
                              fontSize: 14)
        }

    }
}
