//
//  CityWeather.swift
//  WHERE
//
//  Created by Muhannad Sayed Abdullah on 2020-02-24.
//  Copyright © 2020 Muhannad. All rights reserved.
//

import Foundation

struct CityWeather: Codable {
    
    let weather : [weather]
    let main : Main
    let id : Int
    let wind : Wind
}


struct weather : Codable {
    let description : String
}
struct Main : Codable {
    let temp : Double
}

struct Wind : Codable {
    let speed : Double
}
 
 
