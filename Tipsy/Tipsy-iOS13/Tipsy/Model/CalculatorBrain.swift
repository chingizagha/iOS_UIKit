//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Chingiz on 29.12.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    
    var bill = ""
    var text = ""
    
    mutating func calculateBill(amount: Double, tip: Double, split: Double){
        let billWithTip = amount + (amount * tip)
        bill = String(format: "%.0f", billWithTip/split)
        let tipToInt = tip * 100
        text = "Split between \(Int(split)) people, with \(Int(tipToInt)) tip."
    }
    
    func getBill() -> String{
        return bill
    }
    
    func getText() -> String{
        return text    }
}
