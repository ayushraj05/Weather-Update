//
//  ViewController.swift
//  Weather Update
//
//  Created by Ayush Rajpal on 23/05/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SearchTextFlied: UITextField!
    @IBOutlet weak var WeatherConditionImage: UIImageView!
    @IBOutlet weak var TempratureLable: UILabel!
    @IBOutlet weak var CityLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SearchTextFlied.delegate = self
    }

    @IBAction func SearchButtonGotPressed(_ sender: UIButton) {
        SearchTextFlied.endEditing(true)
        print(SearchTextFlied.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextFlied.endEditing(true)
        print(SearchTextFlied.text!)
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
        SearchTextFlied.text = ""
    }
    
}
