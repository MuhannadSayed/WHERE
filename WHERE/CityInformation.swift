//
//  CityInformation.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-26.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import UIKit

class CityInformation: UIViewController {

    @IBOutlet weak var cityInfo: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    var Outside : String = ""
    var temp : Double = 0
    var desc : String = ""
    var speed : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = Outside
         clothes()
        let weatherApi=API()
        weatherApi.fetchWeather(cityName: Outside){
            (Result) in
        switch Result{
        case.success(let weather):
               DispatchQueue.main.async {
                self.temp  = weather.main.temp
                self.speed = weather.wind.speed
                self.desc = weather.weather[0].description
                print(" temp now is : \(self.temp)")
                print("Sky description is : \(self.desc)")
                print("Wind speed is : \(self.speed)")
                self.cityInfo.text = " temp now is : \(self.temp)° and Sky description is : \(self.desc) and wind speed is : \(self.speed)"
                   }
               case.failure(let error): print("Error \(error)")
           
            
    }
            

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    }
    
    func clothes()  {
        //print(desc)
        
        if self.desc.contains("rain"){
           
            self.weatherImage.image = UIImage (systemName: "cloud.rain")
        }else if self.desc.contains("snow"){
            
            self.weatherImage.image = UIImage (systemName: "cloud.snow")
        }else if self.desc.contains("wind"){
            
            self.weatherImage.image = UIImage (systemName: "wind")
        }else {
        
            self.weatherImage.image = UIImage (systemName: "cloud")
        }
    }
}
