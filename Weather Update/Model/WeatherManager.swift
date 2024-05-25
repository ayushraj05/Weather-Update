//
//  WeatherManager.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 25/05/24.
//

import Foundation

struct WeatherManager{
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2286e0f9b64509f787f5a5a4bf1a14b0&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        self.PerformRequest(urlString: urlString)
    }
    
    func PerformRequest(urlString:String) {
        // creat url;
        if let url = URL(string: urlString){
            // creat url session
            
            let session = URLSession(configuration: .default)
            
            // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    parseJSON(weatherData: safeData)
                }
            }
            // start the task
            
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data ){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
                
        }
        catch{
            print(error)
        }
        
    }
    
    
    
    
}
