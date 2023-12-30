//
//  Orders.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct Orders: View {
    
    @EnvironmentObject var order: OrdersModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            ApptizerListCell(apptizer: appetizer)
                        }
                        .onDelete(perform: order.deletItems)
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("Order Placed")
                    } label: {
                        CartButton(titele: "$\(order.totalPrice, specifier: "%.2f") - Place Orer")
                    }
                    .padding(.bottom, 20)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "cart.badge.questionmark", message: "You have no orders in your cart please add some items")
                }
            }
            .navigationTitle("🧳 My Orders")
        }
    }
    
    
    
}

