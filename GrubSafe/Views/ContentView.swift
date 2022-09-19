//
//  ContentView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var onboardingIsVisable = false
    @State private var selectedTab = "Menu"
    let userName = "[userName]"
    let menu = Menu()
    var body: some View {
        VStack {
            HeaderView()
            HStack {
                TabView(selection: $selectedTab) {
                    WelcomeView(userName: userName, onboardingIsVisable: $onboardingIsVisable)
                        .tabItem {
                            Image(systemName: "figure.wave")
                            Text("Welcome")
                        }
                        .tag("Welcome")
                    MenuView(menu: menu)
                        .tabItem {
                            Image(systemName: "menucard")
                            Text("Menu")
                        }
                        .tag("Menu")
                    Text("Your Order")
                        .tabItem {
                            Image(systemName: "bag")
                            Text("Order")
                        }
                        .tag("Order")
                        .badge(3)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("GrubSafe")
                .font(.title)
                .bold()
                .padding()
            Spacer()
        }
    }
}

struct WelcomeView: View {
    var userName: String
    @Binding var onboardingIsVisable: Bool
    var body: some View {
        HStack {
            Text("Welcome, \(userName).")
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Button {
                onboardingIsVisable.toggle()
            } label: {
                Image(systemName: Constants.SFSymbols.questionmark)
                    .font(.title)
            }
            .padding()
            .sheet(isPresented: $onboardingIsVisable) {
                OnboardingView()
            }
        }
    }
}
