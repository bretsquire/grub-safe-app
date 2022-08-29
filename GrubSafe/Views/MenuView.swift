//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    let menu = Menu()
    var body: some View {
        VStack(alignment: .leading) {
            Text("GrubSafe Menu")
                .font(.largeTitle)
                .padding(.top, Constants.Onboarding.rowsTopPadding)
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
            Image(systemName: "circle")
                .font(.body)
                .padding(.trailing)
            Text(text)
                .font(.body)
        }
        .padding(.top, Constants.Onboarding.rowsTopPadding)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        MenuView()
            .preferredColorScheme(.dark)
        MenuView()
            .previewLayout(.fixed(width: 568, height: 320))
        MenuView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
