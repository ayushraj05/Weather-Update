//
//  ViewController.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 23/05/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{

    @IBOutlet weak var SearchTextFlied: UITextField!
    @IBOutlet weak var WeatherConditionImage: UIImageView!
    @IBOutlet weak var TempratureLable: UILabel!
    @IBOutlet weak var CityLable: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        SearchTextFlied.delegate = self
    }
    
    
    @IBAction func CurrentLocationGotPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }

}
// MARK: - UITextFiledDelegate
extension ViewController: UITextFieldDelegate{
    
    
    @IBAction func SearchButtonGotPressed(_ sender: UIButton) {
        SearchTextFlied.endEditing(true)
//        print(SearchTextFlied.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextFlied.endEditing(true)
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
        if let city =  SearchTextFlied.text  {
            weatherManager.fetchWeather(cityName: city)
        }
        
        SearchTextFlied.text = ""
    }
}
//MARK: - WeatherManagerDelegate

extension ViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel){
        DispatchQueue.main.async {
            self.TempratureLable.text = weather.temperatureString
            self.WeatherConditionImage.image = UIImage(systemName: weather.conditionName)
            self.CityLable.text = weather.cityName
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate{
    
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
