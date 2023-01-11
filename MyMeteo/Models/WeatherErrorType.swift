//
//  WeatherError.swift
//  MyMeteo
//
//  Created by Rafael Videira on 02/12/2022.
//

import Foundation

enum WeatherErrorType: Error {
    
    case api(code: String, description: String)
    
    case badUrl
    
    case decoding
    
    case dataUnavailable
}
