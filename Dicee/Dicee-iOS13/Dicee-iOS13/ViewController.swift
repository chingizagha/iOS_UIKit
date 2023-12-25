//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet helps for reference for items
    // #imageLiteral help us change image for imageView
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    var randomNumOne = 0
    var randomNumTwo = 0
    let arrImage = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnRoll(_ sender: Any) {
        randomNumOne = Int.random(in: 0...5)
        randomNumTwo = Int.random(in: 0...5)
        diceImageViewOne.image = arrImage[randomNumOne]
        diceImageViewTwo.image = arrImage[randomNumTwo]
    }
    
}

