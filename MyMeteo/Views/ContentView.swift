//
//  ContentView.swift
//  MyMeteo
//
//  Created by Rafael Videira on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
         VStack {
             Text("Weather please :)")
             
             TextField("Enter a city", text: self.$weatherVM.cityName) {
                 self.weatherVM.search()
             }.font(.custom("Arial", size: 30))
                 .padding()
                 .fixedSize()
             
             switch self.weatherVM.viewState {
                 
                 case .idle:
                     EmptyView()
                     
                 case .loading:
                     ProgressView("Loading...")
                         .font(Font.system(.title2, design: .monospaced).weight(.bold))
                     
                 case .error:
                     Text("City unkown")
                         .font(.custom("Arial", size: 30))
                         .foregroundColor(Color.black)
                         .offset(y: 100)
                         .padding()
                     
                 case .weatherObject(let weather):
                     Text(weather.computedTemperature)
                         .font(.custom("Arial", size: 100))
                         .foregroundColor(Color.black)
                         .offset(y: 100)
                         .padding()
             }
         }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
