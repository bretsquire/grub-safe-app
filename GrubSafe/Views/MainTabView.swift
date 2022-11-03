//
//  ContentView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/21/22.
//

import SwiftUI

public let appSettings = AppSettings.shared

struct MainTabView: View {
    @State private var onboardingIsVisable = false
    @State private var selectedTab = "Menu"
    @State private var order = OrderViewModel()
    @State private var displaySplashScreen = true
    @ObservedObject var menu = MenuViewModel()
    @State private var favorites = appSettings.favorites
    
    let userName = "[userName]"
   
    var body: some View {
        VStack {
            if displaySplashScreen {
                SplashScreen(duration: Constants.Menu.splashScreenDuration)
            } else {
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
                        FavoritesView(menu: menu, favorites: $favorites, order: $order)
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
        .onAppear(perform: {
            Task {
                do {
                    try await menu.fetchMenuItems()
                } catch {
                    print(error)
                }
            }
            Task {
                try? await Task.sleep(nanoseconds: UInt64(Constants.Menu.splashScreenDuration * 1_000_000_000))
                self.displaySplashScreen = false
            }
        })
    }
}

struct MainTabView_Previews: PreviewProvider {
    @ObservedObject static var menu = MenuViewModel.initPreview()
    static var previews: some View {
        MainTabView(menu: menu)
            .previewDisplayName("Portrait")
        MainTabView(menu: menu)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("Landscape")
        MainTabView(menu: menu)
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")
    }
}

struct HeaderView: View {
    @ObservedObject private var networkStatus = appSettings
    var body: some View {
        HStack {
            if networkStatus.hasInternetAccess {
                Text("GrubSafe")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            } else {
                Image(systemName: Constants.SFSymbols.noConnection)
                    .foregroundColor(Color.red)
                Text(" Check Connection ")
                    .font(.title3)
                    .foregroundColor(Color.red)
                    .bold()
                    .padding()
                Image(systemName: Constants.SFSymbols.noConnection)
                    .foregroundColor(Color.red)
            }
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
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
