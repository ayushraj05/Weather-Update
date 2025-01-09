//
//  Sunrise_setView.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 08/01/25.
//

import UIKit

class SunriseSunsetView: UIView {

    // MARK: - Subviews
    private let sunriseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
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
        addSubview(sunriseLabel)
        addSubview(sunsetLabel)

        NSLayoutConstraint.activate([
            // Blur Effect Constraints (Fill the entire view)
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Sunrise Label Constraints
            sunriseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sunriseLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),

            // Sunset Label Constraints
            sunsetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 10)
        ])
    }

    // MARK: - Update View
    func updateSunriseSunset(sunriseTime: String, sunsetTime: String) {
        sunriseLabel.text = "🌅 Sunrise: \(sunriseTime)"
        sunsetLabel.text = "🌙 Sunset: \(sunsetTime)"
    }
}

