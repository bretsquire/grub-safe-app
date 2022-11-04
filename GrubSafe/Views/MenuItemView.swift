//
//  MenuItemView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/12/22.
//

import SwiftUI

struct MenuItemView: View {
    public let appSettings = AppSettings.shared
    
    var item: Item
    @Binding var order: OrderViewModel
    @Binding var favorites: FavoritesViewModel
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: item.images.count > 0 ? item.images[0] : "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/x4cspjvzqn2qk76sjhiw.jpg")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("beefHotdog")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            .scaledToFit()
                            .frame(width: 160)
                VStack {
                    Text("\(item.name)")
                        .font(.headline)
                        .padding()
                    Text("\(item.costAsString)")
                        .font(.body)
                        .padding()
                    HStack {
                        Spacer()
                        Button {
                            order.subtract(item)
                        } label: {
                            Image(systemName: Constants.SFSymbols.removeFromOrder)
                                .font(.title)
                        }
                        Text("\(order.itemsCount(item))")
                            .font(.body)
                            .padding()
                        Button {
                            order.add(item)
                        } label: {
                            Image(systemName: Constants.SFSymbols.addToOrder)
                                .font(.title)
                        }
                        Spacer()
                    }
                    Button {
                        favorites.toggle(item)
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
            Text("\(item.descriptions ?? "")")
                .font(.body)
                .padding()
            Spacer()
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    @ObservedObject static var menu = MenuViewModel.initPreview()
    @State static var previewOrder = OrderViewModel.initPreview()
    @State static var previewFaves = FavoritesViewModel()
    static var previews: some View {
        MenuItemView(item: menu.items[0],
                     order: $previewOrder,
                     favorites: $previewFaves)
        MenuItemView(item: menu.items[0],
                     order: $previewOrder,
                     favorites: $previewFaves)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
