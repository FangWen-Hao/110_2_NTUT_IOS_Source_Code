//
//  MainView.swift
//  Lab 9
//
//  Created by Admin on 2022/5/30.
//

import Foundation
import SwiftUI

@main struct MainView: App {
    @StateObject private var catalogue = AthletesCatalogue()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(catalogue)
        }
    }
}
