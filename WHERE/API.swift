//
//  API.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import Foundation

struct API {


let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=87e5988a0b0fd28d2c7403c4cd907ead&units=metric"

func fetchWeather (cityName : String , completion : @escaping (Result<CityWeather,Error>) -> Void){
    let urlString = "\(weatherURL)&q=\(cityName)"
    if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url){
            (data, response, error) in
            if error != nil{
                print(error!)
            }
            if let safeData = data{
                do{
                 let decoder = JSONDecoder()
                   let status : CityWeather = try decoder.decode(CityWeather.self, from: safeData)
                   completion(.success(status))
               }catch{
                  print("Error with parsa JOSON \(error)")
               }
            }
        }
        task.resume()
    }
        
    }
        
    }
