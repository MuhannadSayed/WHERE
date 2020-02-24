//
//  ViewController.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func checkWeather(_ sender: Any) {
        
        
    print("iam live")
               
               print("Started")
                   let weatherApi=API()
               weatherApi.fetchWeather(cityName: "Paris"){
               (Result) in
               
               switch Result{
               case.success(let weather):
                       DispatchQueue.main.async {
                           let temp : Double = weather.main.temp
                           print(" temp now is : \(temp)")
                           let desc : String = weather.weather[0].description
                           print("Sky description is : \(desc)")
                           // uppdatera UI
                           }
                       case.failure(let error): print("Error \(error)")
                       }
        
                       
               }
           }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

