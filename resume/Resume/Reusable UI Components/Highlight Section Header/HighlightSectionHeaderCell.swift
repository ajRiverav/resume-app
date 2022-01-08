//
//  HighlightSectionHeaderCell.swift
//  Resume
//
//  Created by AJ Rivera on 1/8/22.
//

import UIKit

class HighlightSectionHeaderCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!

    public var viewModel = ViewModel() {
        didSet {
            title.text = viewModel.title
            title.textColor = viewModel.textColor
            contentView.backgroundColor = viewModel.backgroundColor
        }
    }
}

extension HighlightSectionHeaderCell {
    struct ViewModel {
        var title: String = ""
        var textColor: UIColor = .chineseSilver
        var backgroundColor: UIColor = .raisinBlack
    }
}

protocol HighlightConfigurable {
    func configureWith(highlight: Highlight)
}

// MARK: - Custom inits for the view model.
extension HighlightSectionHeaderCell.ViewModel {
    init(_ highlight: Highlight) {
        self.init(title: highlight.title)
    }
}

extension HighlightSectionHeaderCell: HighlightConfigurable {
    func configureWith(highlight: Highlight) {
        viewModel = .init(highlight)
    }
}
