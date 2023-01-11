//
//  Weather.swift
//  MyMeteo
//
//  Created by Rafael Videira on 30/11/2022.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

// Model for the weather
struct Weather: Decodable, Equatable {
    var temp: Double?
    var humidity: Double?
    
    // temperature in good format
    var computedTemperature: String {
        if let temp =  temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    // humidity in good format
    var computedHumidity: String {
        if let humidity = humidity {
            // %.0f = 1 chiffre
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
        
    }
}

