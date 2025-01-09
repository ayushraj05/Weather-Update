//
//  WeatherModel.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 25/05/24.
//

import Foundation

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let feelsLike: Double
    let humidity: Double
    let windSpeed: Double
    let sunrise: Int
    let sunset: Int
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    var feelsLikeString: String{
        return String(format: "%.1f", feelsLike)
    }
    var windSpeedString: String{
        return String(format: "%.2f", windSpeed)
    }
    
    var conditionName: String{
        switch conditionId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
    
    
}
