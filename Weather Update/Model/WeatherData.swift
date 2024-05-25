//
//  WeatherData.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 25/05/24.
//

import Foundation


struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let id: Int
    let description: String
}
