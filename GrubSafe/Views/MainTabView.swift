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
                if !appSettings.hasInternetAccess {
                    NetworkAlertView()
                }
                HStack {
                    TabView(selection: $selectedTab) {
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
                        OrderView(order: $order, favorites: $favorites)
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
            .previewDisplayName("portrait")
        MainTabView(menu: menu)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("landscape")
        MainTabView(menu: menu)
            .preferredColorScheme(.dark)
            .previewDisplayName("dark")
    }
}

struct NetworkAlertView: View {
    var body: some View {
        HStack {
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkAlertView()
    }
}
