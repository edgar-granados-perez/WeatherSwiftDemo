//
//  ContentView.swift
//  WeatherUI
//
//  Created by Edgar Granados-Perez on 5/29/21.
//

import SwiftUI
struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        
        
        ZStack{
            //Color(.blue)
                //edgesIgnoringSafeArea(.all)
            //this creates background
            // view every section as if it where a module of a class. we created a color scenario on top
            // and now everything on the bottom is just a subject of the bottom
            
            
            Background(isNight: $isNight)
            //top  leading tell what occurs
            //also when it comes to parameters you can organize them underneath each other for organization
            VStack{
                CityName(nameOfCity: "Memphis, TN")
                CurrentWeather(currWeatherIcon: "cloud.sun.fill", currentTemp: 90)
                HStack(spacing: 20){
                    WeatherWeek(dayOfWeek: "Mon", weatherImage: "cloud.drizzle.fill", tempOfDay: 10)
                    WeatherWeek(dayOfWeek: "Tues", weatherImage: "cloud.drizzle.fill", tempOfDay: 20)
                    WeatherWeek(dayOfWeek: "Weds", weatherImage: "cloud.drizzle.fill", tempOfDay: 30)
                    WeatherWeek(dayOfWeek: "Thurs", weatherImage: "cloud.drizzle.fill", tempOfDay: 40)
                    WeatherWeek(dayOfWeek: "Fri", weatherImage: "cloud.drizzle.fill", tempOfDay: 50)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(bText: "Change to Time", bColor: .white, fColor: Color.blue)
                }
                Spacer()
                
                
                // this Vstack will contain all the content
                
                //keep in mind a spacer is almost like an empty container
                
                // Lesson: the order of the modifiers matter swiftUI uses stacks a weird way of stack where rather than it being last in first out the code is run first in first out
                // Also this is how font is configuralblefrom not only size but also in padding
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherWeek: View {
    var dayOfWeek: String
    var weatherImage: String
    var tempOfDay:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20.0,
                              weight: .medium,
                              design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                //color sf symbol
                .resizable()
                .aspectRatio(contentMode: .fit)
                // this helps with image reduction
                
                .frame(width: 45, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(tempOfDay)°")
                .font(.system(size: 20.0,
                              weight: .medium,
                              design: .default))
                .foregroundColor(.white)
        }
    }
}

struct Background: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityName: View {
    var nameOfCity: String
    var body: some View{
        Text(nameOfCity)
            .font(.system(size: 32.0,
                          weight: .medium,
                          design: .default))
            .foregroundColor(.white)
            //.frame(width: 200, height: 200, alignment: .center)
            .padding()
    }
}

struct CurrentWeather: View{
    var currWeatherIcon: String
    var currentTemp: Int
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: currWeatherIcon)
                .renderingMode(.original)
                //color sf symbol
                .resizable()
                .aspectRatio(contentMode: .fit)
                // this helps with image reduction
                
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(currentTemp)°")
                .font(.system(size: 60.0,
                              weight: .medium,
                              design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
struct WeatherButton: View{
    var bText: String
    var bColor: Color
    var fColor: Color
    
    var body: some View{
        Text(bText)
            .frame(width: 200,height: 50)
            .background(bColor)
            .foregroundColor(fColor)
            .cornerRadius(10.0)
            .font(.system(size: 20, weight:.medium, design: .default))
    }
}

