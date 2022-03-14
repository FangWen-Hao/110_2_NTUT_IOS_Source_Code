//
//  BMICalculator.swift
//  Fang's Nice BMI Calculator
//
//  Created by Admin on 2022/3/7.
//

import Foundation

class BMICalculator {
    
    public static func getBMI(height: Float, weight: Float) -> Float {
        return calculateBMI(height: height, weight: weight)
    }
    
    public static func getWeightStatus(height: Float, weight: Float, gender: Bool) -> String {
        var weightStatus: String
        let bmi = calculateBMI(height: height, weight: weight)
        
        if (bmi < 18.5) {
            weightStatus = "Underweight"
        } else if (bmi < 25) {
            weightStatus = "Healthy weight"
        } else if (bmi < 30) {
            weightStatus = "Overweight"
        } else if (bmi >= 30){
            weightStatus = "Obesity"
        } else {
            weightStatus = "ERRROR"
        }
    
        if (bmi >= 25 && gender) {
            weightStatus = "it's a secret"
        }
        
        
        return weightStatus
    }
    
    
    private static func calculateBMI(height: Float, weight: Float) -> Float {
      return (weight / (height * height))
    }
    
}
