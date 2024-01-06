//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ currencyManager: CoinManager, currency: CoinModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "342F08FF-0535-4607-84A5-1F8FD9240D49"
    
    var delegate: CoinManagerDelegate?
    
    func fetchCurrency(_ currency: String){
        let fullURL = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(fullURL)
        performRequest(fullURL)
    }
    
    func performRequest(_ fullURL: String){
        if let url = URL(string: fullURL){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    print(safeData)
                    if let coin = self.parseJSON(safeData){
                        self.delegate?.didUpdateCurrency(self, currency: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            
            let coin = CoinModel(rate: rate)
            return coin
        }
        catch{
            print(error)
            return nil
        }
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(_ currency: String) {
        
    }

    
}
