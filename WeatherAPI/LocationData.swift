//
//  LocationData.swift
//  WeatherAPI
//
//  Created by Akshay Yendhe on 08/04/23.
//

import Foundation

struct weatherData : Codable {
    let location : locationData
    let current : currentData
}

struct locationData : Codable {
    let name : String
    let region : String
    let country : String
    let lat : Double
    let lon : Double
    let tz_id : String
    let localtime_epoch : Int
    let localtime : String
}

struct currentData : Codable {
    let last_updated_epoch : Int
    let last_updated : String
    let temp_c : Double
    let temp_f : Double
    let is_day : Int
    let wind_mph : Double
    let wind_kph : Double
    let wind_degree : Int
    let wind_dir : String
    let pressure_mb : Int
    let pressure_in : Double
    let precip_mm : Int
    let precip_in : Int
    let humidity : Int
    let cloud : Int
    let feelslike_c : Double
    let feelslike_f : Double
    let vis_km : Double
    let vis_miles : Int
    let uv : Int
    let gust_mph : Double
    let gust_kph : Double
    var condition : conditionData
}
struct conditionData : Codable {
    let text : String
    let icon : String
    let code : Int
}
