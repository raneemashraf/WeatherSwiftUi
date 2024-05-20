//
//  ContentView.swift
//  WeatherSwiftUi
//
//  Created by raneem on 13/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingDetails = false
    @State private var selectedForecast: Forecastday?
    @State var weather : WeatherResponse?
    
    let locationFetcher = LocationFetcher()
    let weatherViewMode = WeatherViewModel()
    
    let day = Date()
    
    
    var body: some View {
        NavigationView {
            
            let isMorning = Calendar.current.component(.hour, from: day) >= 5 && Calendar.current.component(.hour, from: day) < 18
            
            VStack{
                VStack{
                    Text("\(weather?.location?.name ?? "")")
                        .bold().font(.system(size: 45))
                    Text("\(Int(weather?.current?.tempC ?? 2))°C")
                        .bold().font(.system(size: 50))
                    Text("\(weather?.current?.condition?.text ?? "")")
                        .font(.system(size: 45))
                    // Text("H:12 L:6")
                    Text("\(weather?.current?.pressureMb ?? 3)")
                    
                        .font(.system(size: 40))
                    //Image("cloud")
                    
                    if let currentICon = weather?.current?.condition?.icon {
                        AsyncImage(url: URL(string: "https:" + (currentICon)))
                    }else{
                        Image("cloud")
                    }
                }
                VStack {
                    List {
                        if let forecastDay = weather?.forecast?.forecastday {
                            ForEach(forecastDay.indices, id: \.self) { index in
                                HStack {
                                    if index == 0 {
                                        Text("Today")
                                            .font(.system(size: 27))
                                           
                                    }else{
                                        Text(getDate(value: index))
                                            .font(.system(size: 22))
                                            
                                    }
                                    Spacer()
                                    //Image("sun")
                                    AsyncImage(url: URL(string: "https:" + (forecastDay[index].day?.condition?.icon)!))
                                    Spacer()
                                    Text("\(Int(forecastDay[index].day?.mintempC ?? 8))° - \(Int(forecastDay[index].day?.maxtempC ?? 8))° ")
                                        .font(.system(size: 28))
                                        
                                }.listRowBackground(Color.clear)
                                    .onTapGesture {
                                        selectedForecast = forecastDay[index]
                                        isShowingDetails = true
                                    }
                            }.listRowSeparatorTint(Color.orange)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .frame(width:350,height: 300)
                    NavigationLink(
                        destination:HoursView(forecast: selectedForecast),
                        isActive: $isShowingDetails,
                        label: { EmptyView() }
                    )
                }
                
                .padding(.horizontal,50)
                VStack{
                    HStack {
                        Spacer()
                        VStack{
                            Text("Visibility")
                                .font(.system(size: 20))
                            Text("\(weather?.current?.visKm ?? 2) Km")
                                .font(.system(size: 30))
                        }
                        Spacer()
                        VStack{
                            Text("Humidity")
                                .font(.system(size: 20))
                            Text("\(weather?.current?.humidity ?? 2)%")
                                .font(.system(size: 30))
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        VStack{
                            Text("Pressure")
                                .font(.system(size: 20))
                            Text("\(weather?.current?.pressureMb ?? 2)")
                                .font(.system(size: 30))
                        }
                        Spacer()
                        VStack{
                            Text("Feels Like")
                                .font(.system(size: 20))
                            Text("\(Int(weather?.current?.feelslikeC ?? 2))°")
                                .font(.system(size: 30))
                        }
                        Spacer()
                    }
                }
                .padding(20)
                //.background(Color.black.opacity(0.5))
                .cornerRadius(10)
                
            }.foregroundColor(isMorning ? .black : .white)
             .background(
                    Image(isMorning ? "morning" : "night")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 1.0)
                )
            .onAppear {
                if let currentLocation = locationFetcher.currentLocation {
                        let latitude = currentLocation.coordinate.latitude
                        let longitude = currentLocation.coordinate.longitude
                    weatherViewMode.bindWeatherResponse = { response in 
                        self.weather = response
                    }
                    weatherViewMode.getWeatherResponse(latitude: latitude, longitude: longitude)
                        
                    } else {
                        print("Unable to fetch current location")
                    }
            }
           
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

