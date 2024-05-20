//
//  ApiManger.swift
//  WeatherSwiftUi
//
//  Created by raneem on 13/05/2024.
//

import Foundation


class Service {
    static let shared = Service()
    private let apiKey = "873ce22e70824bb6b3394651241205"
    private let baseUrl = "https://api.weatherapi.com/v1"
    
    private init() {}
    
    func fetchDataFromJson(latitude: Double, longitude: Double, completion: @escaping (WeatherResponse) -> Void) {
        guard let url = URL(string: "\(baseUrl)/forecast.json?key=\(apiKey)&q=\(latitude),\(longitude)&days=3&aqi=yes&alerts=no") else {

            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(WeatherResponse.self, from: data)
                 completion(result)
            } catch {
                print("Error decoding weather response: \(error)")
            }
        }
        
        task.resume()
    }
}

