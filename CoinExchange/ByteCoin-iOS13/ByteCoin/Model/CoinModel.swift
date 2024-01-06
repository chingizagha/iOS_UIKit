//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Chingiz on 06.01.24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel  {
    let rate: Double
    
    var rateString: String{
        return String(format: "%.2f", rate)
        
    }
}
