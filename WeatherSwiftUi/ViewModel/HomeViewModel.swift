//
//  HomeViewModel.swift
//  WeatherSwiftUi
//
//  Created by raneem on 20/05/2024.
//

import Foundation
import Foundation
import Combine
import CoreLocation

class WeatherViewModel {
//@Published var weather: WeatherResponse?
//    @Published var isShowingDetails = false
//    @Published var selectedForecast: Forecastday?
//
//    private var locationFetcher = LocationFetcher()
//
//    init() {
//        fetchWeatherData()
//    }
//
//    func fetchWeatherData() {
//        if let currentLocation = locationFetcher.currentLocation {
//            let latitude = currentLocation.coordinate.latitude
//            let longitude = currentLocation.coordinate.longitude
//
//            Service.shared.fetchDataFromJson(latitude: latitude, longitude: longitude) { [weak self] weatherData in
//                DispatchQueue.main.async {
//                    self?.weather = weatherData
//                }
//            }
//        } else {
//            print("Unable to fetch current location")
//        }
//    }
//
//    func getDate(value: Int) -> String {
//        let date = Calendar.current.date(byAdding: .day, value: value, to: Date()) ?? Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE"
//        return formatter.string(from: date)
//    }
    
var bindWeatherResponse: (WeatherResponse) -> () = {_ in }
    

    
   func getWeatherResponse(latitude: Double, longitude: Double){
       Service.shared.fetchDataFromJson(latitude: latitude, longitude: longitude, completion: { [weak self] response in
             self?.bindWeatherResponse(response)
       })
        
    }
    
}
