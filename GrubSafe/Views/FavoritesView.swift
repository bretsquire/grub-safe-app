//
//  FavoritesView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import SwiftUI

struct FavoritesView: View {
    var menu: MenuViewModel
    @Binding var favorites: FavoritesViewModel
    @ObservedObject var order: OrderViewModel
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Favorites")
                    .font(.largeTitle)
                    .padding()
                ScrollableFavoritesView(menu: menu,
                                        favorites: $favorites,
                                        order: order)
                Spacer()
            }
            .navigationBarTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableFavoritesView: View {
    var menu: MenuViewModel
    @Binding var favorites: FavoritesViewModel
    @ObservedObject var order: OrderViewModel
    var body: some View {
        ScrollView {
            Divider()
            ForEach(favorites.items(menu.items), id: \.id) { item in
                NavigationLink(destination: MenuItemView(item: item,
                                                         order: order,
                                                         favorites: $favorites)) {
                    FavoritesItemRow(item: item)
                }
                Divider()
            }
        }
    }
}

struct FavoritesItemRow: View {
    let item: Item
    var body: some View {
        HStack {
            Text("\(item.name)")
                .font(.body)
            Spacer()
            Text("\(item.costAsString)")
                .font(.body)
        }
        .padding()
    }
}

struct FavoritesView_Previews: PreviewProvider {
    @State static var dummyFaves = FavoritesViewModel.initDummy()
    @ObservedObject static var dummyorder = OrderViewModel.initDummy()
    static var previews: some View {
        let menu = MenuViewModel()
        FavoritesView(menu: menu, favorites: $dummyFaves, order: dummyorder)
    }
}
