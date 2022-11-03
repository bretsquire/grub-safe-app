//
//  OrderView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

import SwiftUI

struct OrderView: View {
    @Binding var order: OrderViewModel
    @Binding var favorites: FavoritesViewModel
    var body: some View {
        NavigationView {
            VStack {
                Text("Your GrubSafe Order")
                    .font(.largeTitle)
                    .padding()
                Text(order.descriptions)
                    .padding()
                ScrollableOrderView(order: $order,
                                    favorites: $favorites)
                Spacer()
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollableOrderView: View {
    @Binding var order: OrderViewModel
    @Binding var favorites: FavoritesViewModel
    var body: some View {
        ScrollView {
            Divider()
            ForEach(order.selection, id: \.id) { item in
                NavigationLink(destination: MenuItemView(item: item,
                                                         order: $order,
                                                         favorites: $favorites)) {
                    OrderItemRow(item: item)
                }
                Divider()
            }
        }
    }
}

struct OrderItemRow: View {
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

struct OrderView_Previews: PreviewProvider {
    @State static var previewOrder = OrderViewModel.initPreview()
    @State static var previewFaves = FavoritesViewModel.initPreview()
    static var previews: some View {
        OrderView(order: $previewOrder, favorites: $previewFaves)
    }
}
