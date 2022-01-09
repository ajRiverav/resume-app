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
            startDate.text = viewModel.startDate ?? ""
            endDate.text = viewModel.endDate ?? ""
            dateSeparator.text = viewModel.dateSeparator ?? ""
            title.text = viewModel.title
            [title, startDate, dateSeparator, endDate].forEach { $0?.textColor = viewModel.textColor }
            contentView.backgroundColor = viewModel.backgroundColor
        }
    }
}

extension SectionHeaderCell {
    struct ViewModel {
        var startDate: String? // TODO: make a Date instead
        var endDate: String?      // TODO: make a Date instead
        var dateSeparator: String?
        var title: String = ""
        var textColor: UIColor = .chineseSilver
        var backgroundColor: UIColor = .raisinBlack
    }
}

// MARK: - Custom inits for the view model.
extension SectionHeaderCell.ViewModel {
    init(_ experience: Experience) {
        self.init(startDate: experience.dates.start.formatted(as: .yyyy, in: .english),
                  endDate: experience.dates.end?.formatted(as: .yyyy, in: .english),
                  dateSeparator: "-", title: experience.place.name)
    }

    init(_ education: Education) {
        self.init(startDate: education.dates.start.formatted(as: .yyyy),
                  endDate: education.dates.end?.formatted(as: .yyyy),
                  dateSeparator: "-", title: education.place.name)
    }
}

protocol ExperienceConfigurable {
    func configureWith(experience: Experience)
}

protocol EducationConfigurable {
    func configureWith(education: Education)
}

extension SectionHeaderCell: ExperienceConfigurable {
    func configureWith(experience: Experience) {
        viewModel = .init(experience)
    }
}

extension SectionHeaderCell: EducationConfigurable {
    func configureWith(education: Education) {
        viewModel = .init(education)
    }
}
