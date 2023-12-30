//
//  OrdersModel.swift
//  APIcall
//
//  Created by jay sabeen on 31/12/23.
//

import SwiftUI

final class OrdersModel: ObservableObject {
    
    @Published var items: [Apptizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func add(_ apptizer: Apptizer) {
        items.append(apptizer)
    }
    
    func deletItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}
