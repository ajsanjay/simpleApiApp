//
//  Orders.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct Orders: View {
    
    @State private var orderItems = MockData.orders
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        ApptizerListCell(apptizer: appetizer)
                    }
                    .onDelete(perform: deletItems)
                }
                .listStyle(PlainListStyle())
                Button {
                    print("Order Placed")
                } label: {
                    CartButton(titele: "Test")
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("🧳 My Orders")
        }
    }
    
    func deletItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
}

#Preview {
    Orders()
}
