//
//  WeatherViewState.swift
//  MyMeteo
//
//  Created by Rafael Videira on 02/12/2022.
//

import Foundation

enum WeatherViewState: Equatable {
    
    case idle
    
    case loading
    
    case error
    
    case weatherObject(Weather)

}
