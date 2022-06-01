//
//  AthleteDetailView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

struct AthleteDetailView: View {
    let athlete: Athlete
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack (alignment: .center){
                Image(athlete.swimmerImage)
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                HStack (alignment: .top) {
                    VStack {
                        Image(athlete.swimmerFlag)
                            .resizable()
                            .frame(width: 100, height: 50, alignment: .leading)
                        Text(athlete.nationality)
                    }
                    Text(athlete.description)
                }
            }
            .navigationTitle(athlete.name)
        }
    }
}

struct AthleteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteDetailView(athlete: .demoAthlete)
    }
}
