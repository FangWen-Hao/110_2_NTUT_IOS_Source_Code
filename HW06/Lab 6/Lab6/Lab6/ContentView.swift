//
//  ContentView.swift
//  Lab6
//
//  Created by Admin on 2022/5/11.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            // Part 1
//            VStack{
//                Image("group")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                Text("Health Sharing")
//                    .bold()
//                    .font(.system(size: 24))
//                HStack{
//                    Image("checklist")
//                        .resizable()
//                        .frame(width:40 , height: 40)
//                    VStack{
//                        Text("You're in Control")
//                            .bold()
//                        Text("Keep friends and family up to date on how you're doing by securely sharing your health Data.")
//                            .font(.system(size: 14))
//                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
//                            .fontWeight(.regular)
//                    }
//                }
//                HStack{
//                    Image("notification")
//                        .resizable()
//                        .frame(width:40 , height: 40)
//                    VStack{
//                        Text("Dashboard and Notifications")
//                            .bold()
//                        Text("Data you share will appear in their Health app. They can also get notifications if there's an update.")
//                            .font(.system(size: 14))
//                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
//                            .fontWeight(.regular)
//                    }
//                }
//                HStack{
//                    Image("lock")
//                        .resizable()
//                        .frame(width:40 , height: 40)
//                    VStack{
//                        Text("Private and Secure")
//                            .bold()
//                        Text("Only a summary of each topic is shared, not the details. The information is encrypted and you can stop sharing at any time.")
//                            .font(.system(size: 14))
//                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
//                            .fontWeight(.regular)
//                    }
//                }
//                Button(action: {
//                    print("Shared!")
//                }) {
//                    Text("Share with someone")
//                        .foregroundColor(.white)
//                }
//                .cornerRadius(20.0)
//                    .frame(width: 240, height: 40, alignment: .center)
//                    .background(Color.blue)
//
//            }
            
            // Part 2
            VStack{
                Image("news")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Text("News+")
                        .bold()
                    VStack{
                        Text("Great news!")
                        
                        Text("Audio stories are here.")
                            .foregroundColor(.red)
                        
                        Text("Listen only in Apple News+.")
                    }
                    Button(action: {
                        print("Started!")
                    }) {
                        Text("Get Started!")
                            .foregroundColor(.white)
                    }
                    .cornerRadius(20.0)
                        .frame(width: 240, height: 40, alignment: .center)
                        .background(Color.red)
                    
                    Text("Plan auto-renews for $9.99/month until canceled.")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
