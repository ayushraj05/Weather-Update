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
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(stackView)
        stackView.addArrangedSubview(sunriseLabel)
        stackView.addArrangedSubview(sunsetLabel)
        
        NSLayoutConstraint.activate([
            // Blur Effect Constraints (Fill the entire view)
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Stack View Constraints (Center it in the view)
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Update View
    func updateSunriseSunset(sunriseTime: Int, sunsetTime: Int) {
        let sr: String = formatUnixTimestamp(sunriseTime)
        let ss: String = formatUnixTimestamp(sunsetTime)
        sunriseLabel.text = "🌅 Sunrise: \(sr)"
        sunsetLabel.text = "🌑 Sunset: \(ss)"
    }
    
    func formatUnixTimestamp(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Example: "06:30 AM"
        formatter.timeZone = TimeZone.current // Use device's current timezone
        return formatter.string(from: date)
    }
}

