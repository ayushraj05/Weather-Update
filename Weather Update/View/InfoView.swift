//
//  InfoView.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 09/01/25.
//

import UIKit

class InfoView: UIView {

    // MARK: - Subviews

    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.cornerRadius = 10
        effectView.clipsToBounds = true
        return effectView
    }()

    private let headingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Setup View

    private func setupView() {
        addSubview(blurEffectView)
        addSubview(headingLabel)
        addSubview(infoLabel)

        NSLayoutConstraint.activate([
            // Blur Effect Constraints
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Heading Label Constraints
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            // Info Label Constraints
            infoLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    // MARK: - Update View

    func updateView(heading: String, info: String) {
        headingLabel.text = heading
        infoLabel.text = info
    }
}

