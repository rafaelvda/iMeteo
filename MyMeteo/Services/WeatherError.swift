//
//  WeatherError.swift
//  MyMeteo
//
//  Created by Rafael Videira on 02/12/2022.
//

import Foundation

struct WeatherError: Decodable {
    
    let cod: Int
    
    let message: String

}
