//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    var menu: MenuViewModel
    @Binding var order: Order
    @Binding var favorites: Favorites
    var body: some View {
        NavigationView {
            VStack {
                ScrollableMenuView(menu: menu,
                                   order: $order,
                                   favorites: $favorites)
                Spacer()
            }
            .navigationBarTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableMenuView: View {
    var menu: MenuViewModel
    @Binding var order: Order
    @Binding var favorites: Favorites
    var body: some View {
        ScrollView {
            Divider()
            ForEach(menu.items, id: \.id) { item in
                NavigationLink(destination: MenuItemView(item: item,
                                                         order: $order,
                                                         favorites: $favorites)) {
                    MenuItemRow(item: item)
                }
                Divider()
            }
        }
    }
}

struct MenuItemRow: View {
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

struct MenuView_Previews: PreviewProvider {
    @State static var dummyorder = Order.initDummy()
    @State static var dummyFaves = Favorites()
    static var previews: some View {
        let menu = MenuViewModel()
        MenuView(menu: menu, order: $dummyorder,
                 favorites: $dummyFaves)
        MenuView(menu: menu, order: $dummyorder,
                 favorites: $dummyFaves)
            .preferredColorScheme(.dark)
        MenuView(menu: menu, order: $dummyorder,
                 favorites: $dummyFaves)
            .previewLayout(.fixed(width: 568, height: 320))
        MenuView(menu: menu, order: $dummyorder,
                 favorites: $dummyFaves)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}


