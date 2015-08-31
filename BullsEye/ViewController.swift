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
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        targetValue = 1 + Int(arc4random_uniform(100))
        
        currentSliderValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentSliderValue)" +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World",
            message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(slider: UISlider) {
        
        currentSliderValue = lroundf(slider.value)
    }
}

