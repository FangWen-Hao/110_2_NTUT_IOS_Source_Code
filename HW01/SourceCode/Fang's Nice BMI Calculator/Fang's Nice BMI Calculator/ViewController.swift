//
//  ViewController.swift
//  Fang's Nice BMI Calculator
//
//  Created by Admin on 2022/3/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var weightStatusLabel: UILabel!
    
    var viewGender = true;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewGender = false
        case 1:
            viewGender = true
        default:
            break
        }
    }

    @IBAction func calculateBMI(sender: UIButton) {
        self.view.endEditing(true)
        
        if Float(heightTextField.text!) == nil {
            bmiLabel.text = ""
            weightStatusLabel.text = "Invalid Height"
        }
        		
        else if Float(weightTextField.text!) == nil {
            bmiLabel.text = ""
            weightStatusLabel.text = "Invalid Weight"
        }
        
        else {
            let viewHeight = (Float(heightTextField.text!)!/100)
//            /100 to Convert from cm to m
            let viewWeight = Float(weightTextField.text!)!
            
            let viewBMI = BMICalculator.getBMI(height: viewHeight, weight: viewWeight)
            let viewWeightStatus = BMICalculator.getWeightStatus(height: viewHeight, weight: viewWeight, gender: viewGender)
            
            bmiLabel.text = viewBMI.description	
            weightStatusLabel.text = viewWeightStatus
        }
        
    }

}

