//
//  AthleteRowView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

struct AthleteRowView: View {
    let athlete: Athlete
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            HStack {
                Image(athlete.swimmerImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                VStack (alignment: .leading) {
                    Text(athlete.name)
                    Text(athlete.nationality)
                }
                Spacer()
            }
        }
    }
}

struct AthleteRowView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteRowView(athlete: .demoAthlete)
    }
}
