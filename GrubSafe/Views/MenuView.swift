//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    var menu: Menu
    var body: some View {
        NavigationView {
            VStack {
//                Text("GrubSafe Menu")
//                    .font(.largeTitle)
//                    .padding(.top, Constants.Menu.rowsTopPadding)
                ScrollView {
                    Divider()
                    ForEach(menu.menuItems, id: \.id) { item in
                        NavigationLink(destination: MenuItemView(item: item)) {
                            MenuItemRow(item: item)
                        }
                        Divider()
                    }
                }
                Spacer()
            }
            .navigationBarTitle("GrubSafe Menu")
            .navigationBarTitleDisplayMode(.large)
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
    static var previews: some View {
        let menu = Menu()
        MenuView(menu: menu)
        MenuView(menu: menu)
            .preferredColorScheme(.dark)
        MenuView(menu: menu)
            .previewLayout(.fixed(width: 568, height: 320))
        MenuView(menu: menu)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
