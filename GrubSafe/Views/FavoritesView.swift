//
//  FavoritesView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: Favorites
    @Binding var order: Order
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Favorites")
                    .font(.largeTitle)
                    .padding()
                ScrollableFavoritesView(favorites: $favorites,
                                        order: $order)
                Spacer()
            }
            .navigationBarTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableFavoritesView: View {
    @Binding var favorites: Favorites
    @Binding var order: Order
    var body: some View {
        ScrollView {
            Divider()
            ForEach(Array(favorites), id: \.id) { item in
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
    let item: MenuItem
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
    @State static var dummyFaves = Favorites.initDummy()
    @State static var dummyorder = Order.initDummy()
    static var previews: some View {
        FavoritesView(favorites: $dummyFaves, order: $dummyorder)
    }
}
