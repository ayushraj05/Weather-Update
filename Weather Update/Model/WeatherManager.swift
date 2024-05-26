//
//  WeatherManager.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 25/05/24.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager{
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2286e0f9b64509f787f5a5a4bf1a14b0&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        self.PerformRequest(with: urlString)
    }
    
    func PerformRequest(with urlString:String) {
        // creat url;
        if let url = URL(string: urlString){
            // creat url session
            
            let session = URLSession(configuration: .default)
            
            // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // start the task
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data)-> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
                
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
    
    
    
    
}
