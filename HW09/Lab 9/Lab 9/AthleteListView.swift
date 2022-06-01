//
//  AthleteListView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

struct AthleteListView: View {
    @EnvironmentObject var catalogue: AthletesCatalogue
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            List {
                ForEach(catalogue.AthletesList) {
                    thisAthlete in
                    NavigationLink(
                        destination: AthleteDetailView(athlete: thisAthlete)) {
                        AthleteRowView(athlete: thisAthlete)
                    }
                }
            }
        }
    }
}

struct AthleteListView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteListView()
            .environmentObject(AthletesCatalogue())
    }
}
