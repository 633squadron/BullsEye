//
//  ViewController.swift
//  BullsEye
//
//  Created by Joe Malin on 2015-08-17.
//  Copyright (c) 2015 The Arwed Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let middleSliderValue: Int = 50
    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var total_points: Int = 0
    var current_round: Int = 0
    
    // Outlet from the slider widget
    @IBOutlet weak var slider: UISlider!
    
    // Outlet to the displayed value of the target
    @IBOutlet weak var targetLabel: UILabel!
    
    // Outlet to the displayed total_points
    @IBOutlet weak var pointsLabel: UILabel!
        
    // Outlet to the current round value
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up the slider UI
        
        // Normal slider image
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        // Highlighted slider image
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        // Insets - These are used to create a "nine-patch" for an image.
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        // Set the left track image, set insets and caps, and set its default length
        // 
        // SliderTrackLeft is a round-capped line, gradient-filled green with expandable
        // ends
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        // Do the same for the right track image as for the left
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
                let trackRightResizable =
                trackRightImage.resizableImageWithCapInsets(insets)
                slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        current_round = 1
        
        // Start a new round
        newPlay()
        
        // Update the values in the UI
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        var diff: Int;
        var message: String;
        var title: String;
        
        var score = 100 - calcDifference(currentSliderValue, targetValue)
 
        title = calcTitle(score)
        
        // Add a bonus for a perfect score
        if (score == 100) {
            
            score += 100
            
        }

        // update the score for the round
        total_points += score
        
        message = "You scored: \(score)"
        
        
        
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK",
            style: .Default,
            handler: {action in
                self.newPlay()
                self.updateLabels()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        
        currentSliderValue = lroundf(slider.value)
    }
    
    func newPlay() {
        
        // reset the random target
        targetValue = 1 + Int(arc4random_uniform(100))
        
        // Set the slider widget position back to the default value
        currentSliderValue = middleSliderValue
        
        slider.value = Float(currentSliderValue)
  
    }
    
    @IBAction func newRound() {
        
        // Increment the round
        current_round++
        
        // Reset the play total
        total_points = 0

        newPlay()
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        pointsLabel.text = String(total_points)
        roundLabel.text = String(current_round)
    }
    
    func calcDifference(sliderVal:Int, _ targetVal:Int) -> Int {
        // Calculate the difference between the target value and the slider value
        
        return abs(sliderVal - targetVal)
    }
    
    func calcTitle(score:Int) -> String {
        var title: String = ""
        
        if (score < 25) {
            
            return "You're a LOSER!"
            
        } else if ((score >= 25) && (score < 70)) {
            
            return "Oh, come ON!"
            
        } else if ((score >= 70) && (score < 90)) {
            
            return "Meh!"
            
        } else if ((score >= 90) && (score < 100)) {
            
            return "You almost had it!"
        
        } else {
            
            return "Perfect!"
            
        }
    }
}

