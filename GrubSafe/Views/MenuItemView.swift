//
//  MenuItemView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/12/22.
//

import SwiftUI

struct MenuItemView: View {
    // MARK: - Singleton Pattern: initialize/access
    public let appSettings = AppSettings.shared
    
    var item: MenuItem
    @Binding var order: Order
    @Binding var favorites: Favorites
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(item.imageName ?? "beefHotdog")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                VStack {
                    Text("\(item.name)")
                        .font(.headline)
                        .padding()
                    Text("\(item.costAsString)")
                        .font(.body)
                        .padding()
                    Button {
                        order.selection.append(item)
                    } label: {
                        Image(systemName: Constants.SFSymbols.addToOrder)
                            .font(.title)
                    }
                    Button {
                        favorites.toggle(item)
                        // MARK: - Singleton Pattern: Used for loading favorites from memento pattern
                        appSettings.favorites = favorites
                    } label: {
                        switch favorites.isFavorite(item) {
                            case true:
                                Image(systemName: "heart.fill").font(.title)
                            default:
                                Image(systemName: "heart").font(.title)
                        }
                    }
                }
            }
            .padding()
            Text("\(item.description ?? "")")
                .font(.body)
                .padding()
            Spacer()
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    @State static var dummyorder = Order.initDummy()
    @State static var dummyFaves = Favorites()
    static var previews: some View {
        let menu = Menu()
        MenuItemView(item: menu.menuItems[3],
                     order: $dummyorder,
                     favorites: $dummyFaves)
        MenuItemView(item: menu.menuItems[0],
                     order: $dummyorder,
                     favorites: $dummyFaves)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
