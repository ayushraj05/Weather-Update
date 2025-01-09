//
//  MainViewController.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 09/01/25.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    
    // IBOutlet
    
    @IBOutlet weak var SearchTextField: UITextField!
    @IBOutlet weak var weatherView: WeatherView!
    @IBOutlet weak var sunriseSunsetView: SunriseSunsetView!
    @IBOutlet weak var feelsLikeView: InfoView!
    @IBOutlet weak var humidityView: InfoView!
    @IBOutlet weak var windSpeedView: InfoView!
    
    // variables & delegates
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        weatherManager.delegate = self
        SearchTextField.delegate = self
        locationManager.requestLocation()
        setNavigationBarTitleWithDate()
        
        
    }
    @IBAction func CurrentLocationGotPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func setNavigationBarTitleWithDate(){
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        let dateString = formatter.string(from: currentDate)
        self.navigationItem.title = dateString
        
    }
}


// MARK: - UITextFiledDelegate
extension MainViewController: UITextFieldDelegate{
    
    
    @IBAction func SearchButtonGotPressed(_ sender: UIButton) {
        SearchTextField.endEditing(true)
//        print(SearchTextFlied.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextField.endEditing(true)
//        print(SearchTextFlied.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // use the SearchTextFeild to search the city
        if let city =  SearchTextField.text  {
            weatherManager.fetchWeather(cityName: city)
        }
        
        SearchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension MainViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel){
        DispatchQueue.main.async {
            // update the ui
            self.weatherView.cityLabel.text = weather.cityName
            self.weatherView.temperatureLabel.text = weather.temperatureString + "°C"
            self.weatherView.weatherIcon.image = UIImage(systemName: weather.conditionName)
            self.sunriseSunsetView.updateSunriseSunset(sunriseTime: weather.sunrise, sunsetTime: weather.sunset)
            print(self.sunriseSunsetView.frame) // Check its frame dimensions

            
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension MainViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    
}



