//
//  OrderView.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

import SwiftUI

struct OrderView: View {
    @Binding var order: Order
    var body: some View {
        VStack {
            Text("Your Order")
                .font(.largeTitle)
                .padding()
            Text(order.description)
                .padding()
            ScrollableOrderView(order: $order)
            Spacer()
        }
    }
}

struct ScrollableOrderView: View {
    @Binding var order: Order
    var body: some View {
        ScrollView {
            Divider()
            ForEach(order.selection, id: \.id) { item in
                OrderItemRow(item: item)
                Divider()
            }
        }
    }
}

struct OrderItemRow: View {
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

struct OrderView_Previews: PreviewProvider {
    @State static var dummyorder = Order.initDummy()
    static var previews: some View {
        OrderView(order: $dummyorder)
    }
}
