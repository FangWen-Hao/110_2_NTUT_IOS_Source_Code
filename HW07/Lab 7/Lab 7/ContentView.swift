//
//  ContentView.swift
//  Lab 7
//
//  Created by Admin on 2022/5/16.
//

import SwiftUI

var athletesArray = createAthletesArray()

let athletesNames = [
    "Dalia Torrez",
    "Michael Phelps",
    "黃渼茜",
    "大橋 悠依",
]

let athletesData = [
    ["Name: Dalia Torrez", "Gender: Female", "Nationality: Nicaragua"],
    ["Name: Michael Phelps", "Gender: Male", "Nationality: USA"],
    ["Name: 黃渼茜", "Gender: Female", "Nationality: Taiwan"],
    ["Name: 大橋 悠依", "Gender: Female", "Nationality: Japan"],

]

let athletesLink = [
    "https://en.wikipedia.org/wiki/Dalia_T%C3%B3rrez_Zamora",
    "https://en.wikipedia.org/wiki/Michael_Phelps",
    "https://en.wikipedia.org/wiki/Huang_Mei-chien",
    "https://en.wikipedia.org/wiki/Yui_Ohashi",
]

let athletesImages = [
    "Dalia",
    "Phelps",
    "Huang",
    "Ohashi",
]


struct ContentView: View {
    var body: some View {
        TabView {
            Tab1View()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Tab2View()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Tab3View(name: athletesArray[0].returnName(),
                     data: athletesArray[0].returnData(),
                     link: athletesArray[0].returnLink())
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Tab1View: View {
    var body: some View {
        NavigationView {
            VStack {
                ForEach(athletesArray.indices, id: \.self) { item in
                    NavigationLink(destination: Tab3View(name: athletesArray[item].returnName(),
                                                         data: athletesArray[item].returnData(),
                                                         link: athletesArray[item].returnLink())) {
                        VStack{
                            ImageView(image: athletesArray[item].returnImage(),
                                      caption: athletesArray[item].returnName())
                        }
                    }
                }
            } .navigationTitle("Athletes")
        } .navigationViewStyle(StackNavigationViewStyle())
    }
}
    

struct Tab2View: View {
    var body: some View {
        VStack {
            Text("Images")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(athletesArray.indices, id: \.self) { item in
                        Image(athletesArray[item].returnImage())
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    let image: String
    let caption: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
            Text(caption)
        }
    }
}

struct Tab3View: View {
    var name: String

    var data: [String]

    var link: String

    mutating func initiateValues() -> Void {
        self.name = athletesArray[0].returnName()
        self.data = athletesArray[0].returnData()
        self.link = athletesArray[0].returnLink()
    }

    var body: some View {
        let columns = [GridItem()]
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(self.data.indices, id: \.self) { item in
                    VStack {
                        Text(self.data[item])
                    }
                }
            }
            if (self.link == "Not Found") {
                Text("\(self.name) has no public link")
            }
            else {
                Link("Click to visit \(self.name) Wikipedia's page", destination: URL(string: self.link)!)
            }
        }
    }
}

struct athlete {
    let name: String
    let data: [String]
    let link: String
    let image: String
    
    func returnName() -> String {return self.name}
    func returnData() -> [String] {return self.data}
    func returnLink() -> String {return self.link}
    func returnImage() -> String {return self.image}
}

private func createAthletesArray() -> [athlete] {
    var thisAthlete: athlete
    var thisAthletesArray = [athlete]()
    for i in stride(from: 0, to: athletesNames.count, by: 1) {
        thisAthlete = athlete(name: athletesNames[i],
               data: athletesData[i],
               link: athletesLink[i],
               image: athletesImages[i])
        thisAthletesArray.append(thisAthlete)
    }
    return thisAthletesArray
}
