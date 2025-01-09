//
//  WeatherData.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 25/05/24.
//

import Foundation


struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}

struct sys: Codable {
    let sunrise: Int
    let sunset: Int
}

struct Weather: Codable {
    let id: Int
    let description: String
}
