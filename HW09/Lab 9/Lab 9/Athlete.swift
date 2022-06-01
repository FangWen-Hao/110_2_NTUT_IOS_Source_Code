//
//  Athlete.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
struct Athlete: Identifiable {
    var id: String { name }
    let name: String
    let gender: String
    let nationality: String
    let description: String
    let swimmerImage: String
    let swimmerFlag: String
}

extension Athlete {
    static let demoAthlete = Athlete(name: "Lorem Ipsum,", gender: "dolor", nationality: "sit amet", description: "consectetur adipiscing elit.", swimmerImage: "DefaultPfp", swimmerFlag: "DefaultFlag")
}
