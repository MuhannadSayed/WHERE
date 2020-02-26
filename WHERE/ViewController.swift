//
//  ViewController.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var clothesLabel: UILabel!
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var userEntry: UITextField!
    var temp : Double = 0
    var desc : String = ""
    
    @IBAction func checkWeather(_ sender: Any) {
       
        search.endEditing(true)

        
    print("iam live")
               
               print("Started")
                   let weatherApi=API()
        weatherApi.fetchWeather(cityName: search.text!){
               (Result) in
               
               switch Result{
               case.success(let weather):
                       DispatchQueue.main.async {
                        self.temp = weather.main.temp
                        print(" temp now is : \(self.temp)")
                        print(weather.id)
                        self.desc = weather.weather[0].description
                        print("Sky description is : \(self.desc)")
                        self.clothes(status: (self.desc), grades: (self.temp))
                           }
                       case.failure(let error): print("Error \(error)")
                       }
        
                       
               }
        
           }
    
 
    
    func clothes(status : String , grades : Double )  {
        //print(desc)
        print(status)
        if status.contains("rain"){
            clothesLabel.text = "temprature is : \(grades) ° and it's raining justnow , take some rainclothes "
            weatherImage.image = UIImage (systemName: "cloud.rain")
        }else if status.contains("snow"){
            clothesLabel.text = "temprature is : \(grades) ° and it's snowing justnow , take some snowclothes "
            weatherImage.image = UIImage (systemName: "cloud.snow")
        }else if status.contains("wind"){
            clothesLabel.text = "temprature is : \(grades) ° and it's windy justnow , take some windclothes "
            weatherImage.image = UIImage (systemName: "wind")
        }else {
        clothesLabel.text = "temprature is : \(grades) ° and nothing special with weather take clothes which suitable to temprature "
            weatherImage.image = UIImage (systemName: "cloud")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        search.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search.endEditing(true)
        print(search.text)
        return true
    }
    
    


}

