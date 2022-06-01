//
//  AthletesCatalogue.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import UIKit

class AthletesCatalogue: ObservableObject {
    @Published var AthletesList = [
        Athlete(name: "Dalia Torrez", gender: "Female", nationality: "Nicaragua", description: "https://en.wikipedia.org/wiki/Dalia_T%C3%B3rrez_Zamora",swimmerImage: "Dalia Torrez", swimmerFlag: "Nicaragua"),
        Athlete(name: "Michael Phelps", gender: "Male", nationality: "USA", description: "https://en.wikipedia.org/wiki/Michael_Phelps",swimmerImage: "Michael Phelps", swimmerFlag: "USA"),
        Athlete(name: "黃渼茜", gender: "Female", nationality: "Taiwan", description: "https://en.wikipedia.org/wiki/Huang_Mei-chien",swimmerImage: "黃渼茜", swimmerFlag: "Taiwan"),
        Athlete(name: "大橋 悠依", gender: "Female", nationality: "Japan", description: "https://en.wikipedia.org/wiki/Yui_Ohashi",swimmerImage: "大橋 悠依", swimmerFlag: "Japan")
    ]
    
    public func AthleteFactory(name: String, gender: String, nationality: String, description: String) -> Void {
        var swimmerImage: String
        var swimmerFlag: String
            
        if (UIImage(named: name) != nil) {
            swimmerImage = name
        } else {
            swimmerImage = "DefaultPfp"
        }
        
        if (UIImage(named: nationality) != nil) {
            swimmerFlag = nationality
        } else {
            swimmerFlag = "DefaultFlag"
        }
        
        self.AthletesList.append(Athlete(name: name, gender: gender, nationality: nationality, description: description, swimmerImage: swimmerImage,swimmerFlag: swimmerFlag ))
    }
}
