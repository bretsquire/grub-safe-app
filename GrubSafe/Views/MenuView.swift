//
//  MenuView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

import SwiftUI

struct MenuView: View {
    @State private var onboardingIsVisable = false
    @ObservedObject var menu: MenuViewModel
    @Binding var order: OrderViewModel
    @Binding var favorites: FavoritesViewModel
    @State var activeSortIndex = 0
    var body: some View {
        NavigationView {
            VStack {
                ScrollableMenuView(menu: menu,
                                   order: $order,
                                   favorites: $favorites)
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: activeSortIndex) { _ in
                menu.sortBy = activeSortIndex
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("GrubSafe - Menu")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        Button {
                            onboardingIsVisable.toggle()
                        } label: {
                            Image(systemName: Constants.SFSymbols.questionmark)
                                .font(.title3)
                        }
                        .sheet(isPresented: $onboardingIsVisable) {
                            OnboardingView()
                        }
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
                            .accessibility(identifier: "sortPicker")
                        }, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .font(.title3)
                        })
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ScrollableMenuView: View {
    @ObservedObject var menu: MenuViewModel
    @Binding var order: OrderViewModel
    @Binding var favorites: FavoritesViewModel
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
    @State static var order = OrderViewModel.initPreview()
    @State static var favorites = FavoritesViewModel()
    @ObservedObject static var menu = MenuViewModel.initPreview()
    static var previews: some View {
        MenuView(menu: menu, order: $order, favorites: $favorites)
            .previewDisplayName("portrait")
        MenuView(menu: menu, order: $order, favorites: $favorites)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("lanscape")
        MenuView(menu: menu, order: $order, favorites: $favorites)
            .preferredColorScheme(.dark)
            .previewDisplayName("dark")
    }
}


