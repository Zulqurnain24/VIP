//
//  CustomTitleView.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import UIKit

class CustomTitleView: UIView {

    internal var contentStackView = UIStackView()
    internal var titleLabel = UILabel()
    internal var subtitleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        viewConfig()
        addViewsConfig()
        layoutViewsConfig()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setTitle(_ title: String) {
        titleLabel.text = title
    }

    public var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }

    public func setSubtitle(_ title: String?) {
        subtitleLabel.text = title
    }

    public var subtitleColor: UIColor? {
        didSet {
            subtitleLabel.textColor = subtitleColor
        }
    }

    private func viewConfig() {
        contentStackView.axis = .vertical
        contentStackView.alignment = .center
        contentStackView.distribution  = .fill
        contentStackView.spacing = 5

        backgroundColor = .clear
        titleLabel.font = UIFont.mediumWithSize(size: 15.0)
        titleLabel.textColor = .white

        subtitleLabel.font = UIFont.mediumWithSize(size: 13.0)
        subtitleLabel.textColor = .white
    }

    private func addViewsConfig() {
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(subtitleLabel)
        addSubview(contentStackView)
    }

    private func layoutViewsConfig() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
        contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
    }

}
