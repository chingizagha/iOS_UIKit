//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]

    @IBOutlet weak var labelHead: UILabel!
    
    @IBOutlet weak var timeProgress: UIProgressView!
    
    @IBAction func btnHardness(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        secondsPassed = 0
        timer.invalidate()
        labelHead.text = hardness
        timeProgress.progress = 0.0
        
                
        totalTime = eggTimes[hardness]!
        print(totalTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if  secondsPassed < totalTime{
            secondsPassed += 1
            timeProgress.progress = Float(secondsPassed)/Float(totalTime)
            
        }
        else if(secondsPassed == totalTime){
            timer.invalidate()
            labelHead.text = "Done"
            playSound()
        }
    }
    
         func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    
}
