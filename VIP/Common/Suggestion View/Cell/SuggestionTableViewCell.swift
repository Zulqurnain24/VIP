//
//  SuggestionTableViewCell.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    internal var suggestionLabel: UILabel = UILabel()

    static public var identifier: String {
        return String(describing: self)
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        suggestionLabel.text = ""
    }

    /**
     * Bind component
     *
     * - parameters:
     *      -viewModel: SuggestionViewModel
     */
    public func bindWithViewModel(_ viewModel: SuggestionViewModel) {
        suggestionLabel.text = viewModel.suggestion
    }
}

// MARK: - Setup views
extension SuggestionTableViewCell {

    /**
     * Setup views
     */
    private func setupViews() {
        backgroundColor = .clear

        configureSubviews()
        addSubviews()
    }

    /**
     * Configure subviews
     */
    private func configureSubviews() {
        suggestionLabel.font = UIFont.mediumWithSize(size: 17.0)
        suggestionLabel.textColor = .black
        suggestionLabel.numberOfLines = 1
        suggestionLabel.backgroundColor = .clear
    }

}

// MARK: - Layout & constraints
extension SuggestionTableViewCell {

    /**
     * Internal struct for layout
     */
    internal struct Layout {

        struct SuggestionsLabel {
            static let leading: CGFloat = 16.0
            static let trailing: CGFloat = 16.0
        }

    }

    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(suggestionLabel)

        addConstraintsWithFormat("H:|-\(Layout.SuggestionsLabel.leading)-[v0]-\(Layout.SuggestionsLabel.trailing)-|", views: suggestionLabel)
        addConstraintsWithFormat("V:|[v0]|", views: suggestionLabel)
    }

}
