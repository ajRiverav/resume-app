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
            iconLabel.font = UIFont(name: iconLabel.font.familyName, size: viewModel.fontSize)
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

    init(icon: UIImage, title: String) {
        self.icon = icon
        self.title = title
    }
}

protocol ExperienceDetailsConfigurable {
    func configureWith(experience: Experience,
                       detailType: ExperienceViewController.Section.RowType, detailIndex: Int)
}

protocol HighlightDetailsConfigurable {
    func configureWith(highlightDetail: String,
                       detailType: SummaryViewController.Section.RowType)
}

protocol EducationDetailsConfigurable {
    func configureWith(education: Education,
                       detailType: EducationViewController.Section.RowType, detailIndex: Int)
}

extension SectionRowCell: ExperienceDetailsConfigurable {
    func configureWith(experience: Experience, detailType: ExperienceViewController.Section.RowType, detailIndex: Int) {
        switch detailType {
        case .location:
            viewModel = .init(icon: Icon.pin.image,
                              title: "\(experience.place.address.city.displayString), \(experience.place.address.state.displayString)")
        case .position:
            viewModel = .init(icon: Icon.groupOfPeople.image, title: experience.position)
        case .highlight:
            // TODO: Uuugh. Fix this -2 thing.
            viewModel = .init(icon: Icon.chevronRight.image,
                              title: experience.emphasisList[detailIndex-2].title,
                              fontSize: 14)
        }

    }
}

extension SectionRowCell: HighlightDetailsConfigurable {
    func configureWith(highlightDetail: String, detailType: SummaryViewController.Section.RowType) {
        switch detailType {
        case .summary:
            viewModel = .init(icon: Icon.chevronRight.image,
                              title: highlightDetail)
        default: return
        }

    }
}

extension SectionRowCell: EducationDetailsConfigurable {
    func configureWith(education: Education, detailType: EducationViewController.Section.RowType, detailIndex: Int) {
        switch detailType {
        case .degree:
            viewModel = .init(icon: Icon.diploma.image, title: education.degree)
        case .location:
            viewModel = .init(icon: Icon.pin.image,
                              title: "\(education.place.address.city.displayString), \(education.place.address.state.displayString)")
        case .highlight:
            // TODO: Uuugh. Fix this -2 thing.
            viewModel = .init(icon: Icon.chevronRight.image,
                              title: education.emphasistList[detailIndex-2],
                              fontSize: 14)

        }
    }
}
