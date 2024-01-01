//
//  WeatherManager.swift
//  Clima
//
//  Created by Chingiz on 01.01.24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=10adf77881f4c9b0a302f77b58f1aaf4&units=metric"
    
    func fetchWeather (cityName: String){
        let fullURL = "\(weatherURL)&q=\(cityName)"
        performRequest(fullURL: fullURL)
    }
    
    func performRequest(fullURL: String){
        if let url = URL(string: fullURL){
            let session = URLSession(configuration: .default)
            
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeDate = data {
                    self.parseJSSON(weatherData: safeDate)
                }
            }
            
            task.resume()
            
        }
    }
    
    func parseJSSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        }
        catch {
            print(error)
        }
        
    }
}
