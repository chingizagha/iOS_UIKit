//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Chingiz on 29.12.23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bmiValue
        infoLabel.text = advice
        self.view.backgroundColor = color
    }
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
