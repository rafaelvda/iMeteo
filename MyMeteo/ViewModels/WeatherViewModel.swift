//
//  WeatherViewModel.swift
//  MyMeteo
//
//  Created by Rafael Videira on 30/11/2022.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService!
        
    @Published var viewState: WeatherViewState = .idle
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var cityName: String = ""
    
    // event called when we search
    func search() {
        // for spaces characters
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    // pass a city and call the getWeather func
    private func fetchWeather(by city: String) {
        self.viewState = .loading
        self.weatherService.getWeather(city: city) { weatherResult in
            DispatchQueue.main.async {
                switch weatherResult {
                    
                case .success(let weather):
                   self.viewState = .weatherObject(weather)
                    break
                case .failure:
                  self.viewState = .error
//                    switch error {
//                    case .api(code: let code, description: let description):
//                        <#code#>
//                    case .badUrl:
//                        <#code#>
//                    case .decoding:
//                        <#code#>
//                    case .dataUnavailable:
//                        <#code#>
//                    }
                }
            }
        }
    }
}

