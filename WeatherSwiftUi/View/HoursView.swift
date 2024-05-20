//
//  HoursView.swift
//  WeatherSwiftUi
//
//  Created by raneem on 14/05/2024.
//

import SwiftUI

struct HoursView: View {
    let forecast : Forecastday?
    let day = Date()
    
    var body: some View {
        
        let isMorning = Calendar.current.component(.hour, from: day) >= 5 && Calendar.current.component(.hour, from: day) < 18
        
        VStack {
            VStack{
                List {
                    if let hours = forecast?.hour {
                    ForEach(hours.indices, id:\.self){ index in
                        HStack {
                             if index == 0{
                              Text("Now")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                                }else{
                                  Text(getHours(value: index))
                                  .font(.system(size: 28))
                                  .foregroundColor(.white)
                                }
                                Spacer()
                            AsyncImage(url: URL(string: "https:" + (hours[index].condition?.icon)!))
                                //Image("sun")
                                Spacer()

                                Text("\(Int(hours[index].tempC ?? 32)) °C")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                
                            }.listRowBackground(Color.clear)
                            
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(isMorning ? "morning" : "night")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
    }
}
struct HoursView_Previews: PreviewProvider {
    static var previews: some View {
        HoursView(forecast: nil)
    }
}
