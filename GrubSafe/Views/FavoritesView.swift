//
//  FavoritesView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: Favorites
    var body: some View {
        VStack {
            Text("Your Favorites")
                .font(.largeTitle)
                .padding()
            ScrollableFavoritesView(favorites: $favorites)
            Spacer()
        }
    }
}

// MARK: - Interator Pattern: Favorites is iterable
struct ScrollableFavoritesView: View {
    @Binding var favorites: Favorites
    var body: some View {
        ScrollView {
            Divider()
            ForEach(Array(favorites), id: \.id) { item in
                FavoritesItemRow(item: item)
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
    static var previews: some View {
        FavoritesView(favorites: $dummyFaves)
    }
}
