//
//  ContentView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var catalogue: AthletesCatalogue
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            NavigationView{
                VStack {
                    AthleteListView().environmentObject(catalogue)
                    NavigationLink(
                        destination: AddAthleteView().environmentObject(catalogue)) {
                        Text(" + Add New Athlete ")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }            }
                .navigationTitle("Catalogue of Athletes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AthletesCatalogue())
    }
}
