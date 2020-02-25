//
//  ViewController.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var userEntry: UITextField!
    @IBAction func checkWeather(_ sender: Any) {
        //user()
        print(user())
        search.endEditing(true)

        
    print("iam live")
               
               print("Started")
                   let weatherApi=API()
        weatherApi.fetchWeather(cityName: search.text!){
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
    
    func user() -> String {
        print(userEntry.text)
        let u : String = ""
        if  userEntry.text! != "" {
            print(u)
        }else{
            print("nothing to eat")
        }
        return u
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

