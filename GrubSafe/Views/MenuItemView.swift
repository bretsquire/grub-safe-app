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
                        
                    } label: {
                        Image(systemName: Constants.SFSymbols.addToOrder)
                            .font(.title)
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
    static var previews: some View {
        let menu = Menu()
        MenuItemView(item: menu.menuItems[3])
        MenuItemView(item: menu.menuItems[0])
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
