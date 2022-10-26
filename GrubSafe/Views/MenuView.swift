//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menu: MenuViewModel
    @Binding var order: Order
    @Binding var favorites: Favorites
    @State var activeSortIndex = 0
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
            .onChange(of: activeSortIndex) { _ in
                menu.sortBy = activeSortIndex
            }
            .toolbar {
                Menu(content: {
                    Picker(
                        selection: $activeSortIndex,
                        content: {
                            ForEach(0..<menu.sortTypes.count, id: \.self) { index in
                                let sortType = menu.sortTypes[index]
                                Text(sortType.name)
                            }
                        },
                        label: {}
                    )
                }, label: {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                })
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ScrollableMenuView: View {
    @ObservedObject var menu: MenuViewModel
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

//struct MenuView_Previews: PreviewProvider {
//    @State static var dummyorder = Order.initDummy()
//    @State static var dummyFaves = Favorites()
//    @StateObject static var menu = MenuViewModel()
//    static var previews: some View {
//        //let menu = MenuViewModel()
//        MenuView(menu: $menu, order: $dummyorder,
//                 favorites: $dummyFaves)
//        MenuView(menu: $menu, order: $dummyorder,
//                 favorites: $dummyFaves)
//            .preferredColorScheme(.dark)
//        MenuView(menu: $menu, order: $dummyorder,
//                 favorites: $dummyFaves)
//            .previewLayout(.fixed(width: 568, height: 320))
//        MenuView(menu: $menu, order: $dummyorder,
//                 favorites: $dummyFaves)
//            .preferredColorScheme(.dark)
//            .previewLayout(.fixed(width: 568, height: 320))
//    }
//}


