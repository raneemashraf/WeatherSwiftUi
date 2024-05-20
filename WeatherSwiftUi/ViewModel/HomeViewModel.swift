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
    
var bindWeatherResponse: (WeatherResponse) -> () = {_ in }
    
   func getWeatherResponse(latitude: Double, longitude: Double){
       Service.shared.fetchDataFromJson(latitude: latitude, longitude: longitude, completion: { [weak self] response in
             self?.bindWeatherResponse(response)
       })
        
    }
    
}
