//
//  ContentView.swift
//  Lab08
//
//  Created by Admin on 2022/5/25.
//

import SwiftUI

struct ContentView: View {
    let swimmers = ["Torrez", "Phelps", "黃渼茜", "大橋 悠依"]
    let myGradient = Gradient(colors: [.white, .blue])

    @State private var name = ""
    @State private var age = 0
    @State private var like:Float = 0
    @State private var selectionIndex = 0
    @State private var canSwim = false
    @State private var birthday = Date()
    @State private var message :String = ""
    @State private var alertShowBool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: myGradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{	
                Group{
                    Text("Swimming")
                    Image("swimmingPool").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                HStack{
                    Text("My name is:   ")
                    TextField("Please enter your name", text:$name)
                }
                
                Stepper("I am:\(age) years old",onIncrement:{
                    age+=1
                },onDecrement:{
                    age-=1
                })
                HStack{
                    Text("How much do you like swimming?")
                    Slider(value: $like, in: 0...100)
                    Text("\(Int(like))%   ")
                }
                Text("I think \(swimmers[selectionIndex]) is the best!")
                Picker(selection: $selectionIndex, label: Text("Please select an athlete")){
                    ForEach(swimmers.indices){
                        (index) in
                        Text(swimmers[index])
                    }
                }
                DatePicker("What's the time?",selection :$birthday, displayedComponents:.date)
                Text("Today is \(birthday)")
                
                HStack{
                    Toggle("Can you swim?", isOn: $canSwim)
                    if(canSwim){
                        Text("\(name) can swim")
                    }else{
                        Text("\(name) cannot swim")
                    }
                }
                
                Button(action: {
                    alertShowBool = true
                }, label: {
                    Text("submit")
                })
                
            }
        }.alert(isPresented: $alertShowBool) {
            Alert(
                title: Text("Hi, my name is \(name)."),
                message: Text("I am \(age) years old.\n\n My birthday is on \(birthday.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")).\n\n I like swimming about\(Int(like))%.\n\n My favorite swimmer is \(swimmers[selectionIndex]).")
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
