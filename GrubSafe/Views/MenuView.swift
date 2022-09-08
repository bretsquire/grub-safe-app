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
        VStack(alignment: .leading) {
            Text("GrubSafe Menu")
                .font(.largeTitle)
                .padding(.top, Constants.Menu.rowsTopPadding)
            ForEach(menu.menuItems, id: \.id) { item in
                MenuItemRow(text: item.name)
            }
            Spacer()
        }
    }
}

struct MenuItemRow: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: Constants.SFSymbols.circle)
                .font(.body)
                .padding(.trailing)
            Text(text)
                .font(.body)
        }
        .padding(.top, Constants.Menu.rowsTopPadding)
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
