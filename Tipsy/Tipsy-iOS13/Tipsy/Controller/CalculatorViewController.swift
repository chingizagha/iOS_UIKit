//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Chingiz on 29.12.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var amountPerson: String?
    var titleText: String?
    
    @IBOutlet weak var amountPersonLabel: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountPersonLabel.text = amountPerson
        labelText.text = titleText
    }
    
    
    @IBAction func btnRecalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
