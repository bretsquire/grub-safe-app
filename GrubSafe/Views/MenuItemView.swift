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
    @Binding var favorites: Favorites
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: item.images.count > 0 ? item.images[0] : "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/x4cspjvzqn2qk76sjhiw.jpg")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("beefHotdog")
                            }
                            //.resizable()
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

//struct MenuItemView_Previews: PreviewProvider {
//    @State static var dummyorder = OrderViewModel.initDummy()
//    @State static var dummyFaves = Favorites()
//    static var previews: some View {
//        let menu = Menu()
//        MenuItemView(item: menu.menuItems[3],
//                     order: $dummyorder,
//                     favorites: $dummyFaves)
//        MenuItemView(item: menu.menuItems[0],
//                     order: $dummyorder,
//                     favorites: $dummyFaves)
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
