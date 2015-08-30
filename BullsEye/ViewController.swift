//
//  ViewController.swift
//  BullsEye
//
//  Created by Joe Malin on 2015-08-17.
//  Copyright (c) 2015 The Arwed Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentSliderValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentSliderValue)"
        
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

