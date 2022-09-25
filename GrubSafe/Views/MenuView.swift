//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    var menu: Menu
    @Binding var order: Order
    var body: some View {
        NavigationView {
            VStack {
                ScrollableMenuView(menu: menu, order: $order)
                Spacer()
            }
            .navigationBarTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableMenuView: View {
    var menu: Menu
    @Binding var order: Order
    var body: some View {
        ScrollView {
            Divider()
            ForEach(menu.menuItems, id: \.id) { item in
                NavigationLink(destination: MenuItemView(item: item, order: $order)) {
                    MenuItemRow(item: item)
                }
                Divider()
            }
        }
    }
}

struct MenuItemRow: View {
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

struct MenuView_Previews: PreviewProvider {
    @State static var dummyorder = Order.initDummy()
    static var previews: some View {
        let menu = Menu()
        MenuView(menu: menu, order: $dummyorder)
        MenuView(menu: menu, order: $dummyorder)
            .preferredColorScheme(.dark)
        MenuView(menu: menu, order: $dummyorder)
            .previewLayout(.fixed(width: 568, height: 320))
        MenuView(menu: menu, order: $dummyorder)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}


