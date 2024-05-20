//
//  Weather.swift
//  WeatherSwiftUi
//
//  Created by raneem on 13/05/2024.
//
import Foundation
import UIKit

struct WeatherResponse: Decodable {
    var location: Location? = Location()
    var current: Current? = Current()
    var forecast: Forecast? = Forecast()
}

struct Location: Codable {
    var name: String? = nil
    var region: String? = nil
    var country: String? = nil
    var lat: Double? = nil
    var lon: Double? = nil
    var tzId: String? = nil
    var localtimeEpoch: Int? = nil
    var localtime: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime = "localtime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tzId = try values.decodeIfPresent(String.self, forKey: .tzId)
        localtimeEpoch = try values.decodeIfPresent(Int.self, forKey: .localtimeEpoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }
    
    init() {
    }
}

struct Condition: Codable {
    var text: String? = nil
    var icon: String? = nil
    var code: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case icon = "icon"
        case code = "code"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
    
    init() {
    }
}

struct Current: Decodable {
    var lastUpdatedEpoch: Int? = nil
    var lastUpdated: String? = nil
    var tempC: Double? = nil
    var tempF: Double? = nil
    var isDay: Int? = nil
    var condition: Condition? = Condition()
    var windMph: Double? = nil
    var windKph: Double? = nil
    var windDegree: Int? = nil
    var windDir: String? = nil
    var pressureMb: Int? = nil
    var pressureIn: Double? = nil
    var precipMm: Int? = nil
    var precipIn: Int? = nil
    var humidity: Int? = nil
    var cloud: Int? = nil
    var feelslikeC: Double? = nil
    var feelslikeF: Double? = nil
    var visKm: Int? = nil
    var visMiles: Int? = nil
    var uv: Int? = nil
    var gustMph: Double? = nil
    var gustKph: Double? = nil
    
    //var airQuality : AirQuality? = AirQuality()
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv = "uv"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        // case airQuality = "air_quality"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lastUpdatedEpoch = try values.decodeIfPresent(Int.self, forKey: .lastUpdatedEpoch)
        lastUpdated = try values.decodeIfPresent(String.self, forKey: .lastUpdated)
        tempC = try values.decodeIfPresent(Double.self, forKey: .tempC)
        tempF = try values.decodeIfPresent(Double.self, forKey: .tempF)
        isDay = try values.decodeIfPresent(Int.self, forKey: .isDay)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        windMph = try values.decodeIfPresent(Double.self, forKey: .windMph)
        windKph = try values.decodeIfPresent(Double.self, forKey: .windKph)
        windDegree = try values.decodeIfPresent(Int.self, forKey: .windDegree)
        windDir = try values.decodeIfPresent(String.self, forKey: .windDir)
        pressureMb = try values.decodeIfPresent(Int.self, forKey: .pressureMb)
        pressureIn = try values.decodeIfPresent(Double.self, forKey: .pressureIn)
        precipMm = try values.decodeIfPresent(Int.self, forKey: .precipMm)
        precipIn = try values.decodeIfPresent(Int.self, forKey: .precipIn)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        feelslikeC = try values.decodeIfPresent(Double.self, forKey: .feelslikeC)
        feelslikeF = try values.decodeIfPresent(Double.self, forKey: .feelslikeF)
        visKm = try values.decodeIfPresent(Int.self, forKey: .visKm)
        visMiles = try values.decodeIfPresent(Int.self, forKey: .visMiles)
        uv = try values.decodeIfPresent(Int.self, forKey: .uv)
        gustMph = try values.decodeIfPresent(Double.self, forKey: .gustMph)
        gustKph = try values.decodeIfPresent(Double.self, forKey: .gustKph)
    }
    
    init() {
    }
}

struct Forecastday: Codable {
    var date: String? = nil
    var dateEpoch: Int? = nil
    var day: Day? = Day()
    var hour: [Hour]? = []

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateEpoch = "date_epoch"
        case day = "day"
        // case astro = "astro"
        case hour = "hour"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        dateEpoch = try values.decodeIfPresent(Int.self, forKey: .dateEpoch)
        day = try values.decodeIfPresent(Day.self, forKey: .day)
        // astro = try values.decodeIfPresent(Astro.self, forKey: .astro)
        hour = try values.decodeIfPresent([Hour].self, forKey: .hour)
    }
    
    init() {
    }
}

struct Forecast: Codable {
    var forecastday: [Forecastday]? = []

    enum CodingKeys: String, CodingKey {
        case forecastday = "forecastday"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        forecastday = try values.decodeIfPresent([Forecastday].self, forKey: .forecastday)
    }
    
    init() {
    }
}

struct Day: Codable {
    var maxtempC: Double? = nil
    var maxtempF: Double? = nil
    var mintempC: Double? = nil
    var mintempF: Double? = nil
    var avgtempC: Double? = nil
    var avgtempF: Double? = nil
    var maxwindMph: Double? = nil
    var maxwindKph: Double? = nil
    var totalprecipMm: Int? = nil
    var totalprecipIn: Int? = nil
    var condition: Condition? = Condition()
    var avgvisKm: Int? = nil
    var avgvisMiles: Int? = nil
    var avghumidity: Int? = nil
    var dailyWillItRain: Int? = nil
    var dailyChanceOfRain: Int? = nil
    var dailyWillItSnow: Int? = nil
    var dailyChanceOfSnow: Int? = nil
    var uv: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case condition = "condition"
        // case totalsnowCm = "totalsnow_cm"
        case avgvisKm = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity = "avghumidity"
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case uv = "uv"
        // case airQuality = "air_quality"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxtempC = try values.decodeIfPresent(Double.self, forKey: .maxtempC)
        maxtempF = try values.decodeIfPresent(Double.self, forKey: .maxtempF)
        mintempC = try values.decodeIfPresent(Double.self, forKey: .mintempC)
        mintempF = try values.decodeIfPresent(Double.self, forKey: .mintempF)
        avgtempC = try values.decodeIfPresent(Double.self, forKey: .avgtempC)
        avgtempF = try values.decodeIfPresent(Double.self, forKey: .avgtempF)
        maxwindMph = try values.decodeIfPresent(Double.self, forKey: .maxwindMph)
        maxwindKph = try values.decodeIfPresent(Double.self, forKey: .maxwindKph)
        totalprecipMm = try values.decodeIfPresent(Int.self, forKey: .totalprecipMm)
        totalprecipIn = try values.decodeIfPresent(Int.self, forKey: .totalprecipIn)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        // totalsnowCm = try values.decodeIfPresent(Int.self, forKey: .totalsnowCm)
        avgvisKm = try values.decodeIfPresent(Int.self, forKey: .avgvisKm)
        avgvisMiles = try values.decodeIfPresent(Int.self, forKey: .avgvisMiles)
        avghumidity = try values.decodeIfPresent(Int.self, forKey: .avghumidity)
        dailyWillItRain = try values.decodeIfPresent(Int.self, forKey: .dailyWillItRain)
        dailyChanceOfRain = try values.decodeIfPresent(Int.self, forKey: .dailyChanceOfRain)
        dailyWillItSnow = try values.decodeIfPresent(Int.self, forKey: .dailyWillItSnow)
        dailyChanceOfSnow = try values.decodeIfPresent(Int.self, forKey: .dailyChanceOfSnow)
        uv = try values.decodeIfPresent(Int.self, forKey: .uv)
        // airQuality = try values.decodeIfPresent(AirQuality.self, forKey: .airQuality)
    }
    
    init() {
    }
}

struct Hour: Codable {
    var timeEpoch: Int? = nil
    var time: String? = nil
    var tempC: Double? = nil
    var tempF: Double? = nil
    var isDay: Int? = nil
    var condition: Condition? = Condition()
    var windMph: Double? = nil
    var windKph: Double? = nil
    var windDegree: Int? = nil
    var windDir: String? = nil
    var pressureMb: Double? = nil
    var pressureIn: Double? = nil
    var precipMm: Double? = nil
    var precipIn: Double? = nil
    var snowCm: Double? = nil
    var humidity: Int? = nil
    var cloud: Int? = nil
    var feelslikeC: Double? = nil
    var feelslikeF: Double? = nil
    var windchillC: Double? = nil
    var windchillF: Double? = nil
    var heatindexC: Double? = nil
    var heatindexF: Double? = nil
    var dewpointC: Double? = nil
    var dewpointF: Double? = nil
    var willItRain: Int? = nil
    var chanceOfRain: Int? = nil
    var willItSnow: Int? = nil
    var chanceOfSnow: Int? = nil
    var visKm: Double? = nil
    var visMiles: Double? = nil
    var gustMph: Double? = nil
    var gustKph: Double? = nil
    var uv: Double? = nil

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time = "time"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCm = "snow_cm"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv = "uv"
    }
}

