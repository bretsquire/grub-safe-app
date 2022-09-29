//
//  ContentView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/21/22.
//

import SwiftUI

// MARK: - Singleton Pattern: initialize/access
public let appSettings = AppSettings.shared

struct MainTabView: View {
    @State private var onboardingIsVisable = false
    @State private var selectedTab = "Menu"
    @State private var order = Order()
    
    // MARK: - Singleton Pattern: Used for loading favorites from memento pattern
    @State private var favorites = appSettings.favorites
    
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
                    MenuView(menu: menu, order: $order, favorites: $favorites)
                        .tabItem {
                            Image(systemName: "menucard")
                            Text("Menu")
                        }
                        .tag("Menu")
                    FavoritesView(favorites: $favorites, order: $order)
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                        .tag("Favorites")
                    OrderView(order: $order)
                        .tabItem {
                            Image(systemName: "bag")
                            Text("Order")
                        }
                        .tag("Order")
                        .badge(order.selection.count)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
        MainTabView()
            .previewInterfaceOrientation(.landscapeLeft)
        MainTabView()
            .preferredColorScheme(.dark)
        MainTabView()
            .previewLayout(.fixed(width: 568, height: 320))
        MainTabView()
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
