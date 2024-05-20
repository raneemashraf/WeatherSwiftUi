//
//  Utilities.swift
//  WeatherSwiftUi
//
//  Created by raneem on 16/05/2024.
//

import Foundation
import UIKit

func getDate(value:Int) -> String {
    let date = Date()
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"

    let day = calendar.date(byAdding: .day, value: value, to: date)!
    let formattedDay = dateFormatter.string(from: day)

   return (formattedDay)
    
}
func getHours(value: Int) -> String {
    let date = Date()
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h a"
    
    let hour = calendar.date(byAdding: .hour, value: value, to: date)!
    let formattedHour = dateFormatter.string(from: hour)

    return formattedHour
}
func getImageFromUrl(imageCode: Double) -> UIImage? {
    switch imageCode {
    case 1000:
        return UIImage(named: "sun")
    case 1009:
        return UIImage(named: "clear_sky_night")
    case 1003,1006:
        return UIImage(named: "cloud")
    case 1279:
        return UIImage(named: "clouds_night")
    case 1135,1183,1186,1192,1195,1198,1063,1180,1189:
        return UIImage(named: "rain_day")
    case 1072,1087:
        return UIImage(named: "thunder_day")
    case 1114,1147,1222,1066,1213:
        return UIImage(named: "snow_day")
    case 1030,1117:
        return UIImage(named: "mist_day")
    default:
        print(imageCode)
        return UIImage(named: "sun")
    }
}
