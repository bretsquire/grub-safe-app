//
//  MenuItemView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/12/22.
//

import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(item.name)")
                    .font(.headline)
                    .padding()
                Spacer()
                Text("\(item.costAsString)")
                    .font(.body)
                    .padding()
            }
            Text("\(item.description ?? "")")
                .font(.body)
                .padding()
            Spacer()
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let menu = Menu()
        MenuItemView(item: menu.menuItems[0])
    }
}
