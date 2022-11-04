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
    @Binding var order: OrderViewModel
    var body: some View {
        NavigationView {
            VStack {
                ScrollableFavoritesView(menu: menu,
                                        favorites: $favorites,
                                        order: $order)
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("GrubSafe - Favorites")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableFavoritesView: View {
    var menu: MenuViewModel
    @Binding var favorites: FavoritesViewModel
    @Binding var order: OrderViewModel
    var body: some View {
        ScrollView {
            Divider()
            ForEach(favorites.items(menu.items), id: \.id) { item in
                NavigationLink(destination: MenuItemView(item: item,
                                                         order: $order,
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
    @ObservedObject static var menu = MenuViewModel.initPreview()
    @State static var favorites = FavoritesViewModel.initPreview()
    @State static var order = OrderViewModel.initPreview()
    static var previews: some View {
        return FavoritesView(menu: menu, favorites: $favorites, order: $order)
    }
}
