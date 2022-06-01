//
//  AddAthleteView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

struct AddAthleteView: View {
    @EnvironmentObject var catalogue: AthletesCatalogue
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @State private var tempoName = ""
    @State private var tempoGender = ""
    @State private var tempoNat = ""
    @State private var tempoDesc = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack (alignment: .leading){
                Text("Athlete's Name: ")
                TextField("Athlete's Name", text: $tempoName)
                    .padding()
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 3))
                
                Text("Athlete's Gender: ")
                TextField("Athlete's Gender", text: $tempoGender)
                    .padding()
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 3))
                
                Text("Athlete's Nationality: ")
                TextField("Athlete's Nationality", text: $tempoNat)
                    .padding()
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 3))

                Text("Athlete's Description: ")
                TextField("Athlete's Description", text: $tempoDesc)
                    .padding()
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 3))
                
                Button {
                    catalogue.AthleteFactory(name: tempoName, gender: tempoGender, nationality: tempoNat, description: tempoDesc)
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Submit")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
            }
        }
        .navigationTitle("Add an Athlete to your catalogue")
    }
}

struct AddAthleteView_Previews: PreviewProvider {
    static var previews: some View {
        AddAthleteView()
            .environmentObject(AthletesCatalogue())
    }
}
