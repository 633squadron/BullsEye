//
//  ViewController.swift
//  BullsEye
//
//  Created by Joe Malin on 2015-08-17.
//  Copyright (c) 2015 The Arwed Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    // Outlet from the slider widget
    @IBOutlet weak var slider: UISlider!
    
    // Outlet to the displayed value of the target
    @IBOutlet weak var targetLabel: UILabel!
    
    // Outlet to the displayed score
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Outlet to the current slider value
    @IBOutlet weak var sliderLabel: UILabel!
    
    // Outlet to the current round value
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start a new round
        startNewRound()
        
        // Update the values in the UI
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Start a new round
    
    func startNewRound() {
        
        // reset the random target
        targetValue = 1 + Int(arc4random_uniform(100))
        
        // Set the slider value to 50
        currentSliderValue = 50
        
        // Set the slider widget position back to 50
        slider.value = Float(currentSliderValue)

        // Reset the score
        score = 0
        
        // Increment the round
        round++
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        sliderLabel.text = String(currentSliderValue)
    }
    
    func calcDifference(sliderVal:Int, _ targetVal:Int) -> Int {
        // Calculate the difference between the target value and the slider value
    
        return abs(sliderVal - targetVal)
    }

    @IBAction func showAlert() {
        var diff: Int;
        var message: String;
        
        let points = 100 - calcDifference(currentSliderValue, targetValue)
        

        // update the score for the round
        score += points
        
        message = "You scored: \(points)"
        
        let alert = UIAlertController(title: "Result",
            message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        // Start a new round
        startNewRound()
        
        // Update the values in the UI
        updateLabels()
    }
    @IBAction func sliderMoved(slider: UISlider) {
        
        currentSliderValue = lroundf(slider.value)
    }
}

