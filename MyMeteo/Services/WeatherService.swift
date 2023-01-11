//
//  WeatherService.swift
//  MyMeteo
//
//  Created by Rafael Videira on 30/11/2022.
//

import Foundation

class WeatherService {
    
    /// Retrieve temp of a city with an API call
    /// - Parameters:
    ///   - city: city to search
    ///   - completion: asynch to wait for data
    func getWeather(city: String, completion: @escaping (Result<Weather, WeatherErrorType>) -> ()) {
        
        // Call this adress
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7b0c055169ea70101ee2ddb231abe2e9&units=metric") else {
            completion(.failure(.badUrl))
            return
        }
        
        // Object brut != htpps with code error etc
        // Get the code, data and error 
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            // Decode response and matchs our weather model
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            // Finish the completion
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(.success(weather))
            } else if let weatherErrorResponse = try?  JSONDecoder().decode(WeatherError.self, from: data) {
                completion(.failure(.api(code: String(weatherErrorResponse.cod), description: weatherErrorResponse.message)))
                
            } else {
                completion(.failure(.dataUnavailable))
            }

        }.resume()
    }
}
