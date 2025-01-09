//
//  WeatherView.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 08/01/25.
//

import UIKit

class WeatherView: UIView {

    // MARK: - Subviews
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 60) // Large and bold
        label.textColor = .black
        label.text = "14°C" // Default text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20) // Smaller and bold
        label.textColor = .black
        label.text = "Jaipur" // Default text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "sun.max.fill") // Default icon
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.cornerRadius = 10
        effectView.clipsToBounds = true
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
        backgroundColor = .clear
        addSubview(blurEffectView)
        addSubview(temperatureLabel)
        addSubview(cityLabel)
        addSubview(weatherIcon)

        NSLayoutConstraint.activate([
            // Temperature Label Constraints
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            // City Label Constraints
            cityLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor),
            cityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 5),
            
            // Weather Icon Constraints
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 50),
            weatherIcon.heightAnchor.constraint(equalToConstant: 50),
            
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

