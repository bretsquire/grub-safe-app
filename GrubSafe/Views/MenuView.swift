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
        VStack {
            Text("GrubSafe Menu")
                .font(.largeTitle)
                .padding(.top, Constants.Menu.rowsTopPadding)
            ScrollView {
                Divider()
                ForEach(menu.menuItems, id: \.id) { item in
                    MenuItemRow(item: item)
                    Divider()
                }
            }
            Spacer()
        }
    }
}

struct MenuItemRow: View {
    let item: MenuItem
    var body: some View {
        HStack {
            Text("\(item.name) \(item.costAsString)")
                .font(.body)
            Spacer()
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
