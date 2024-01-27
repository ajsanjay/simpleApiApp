//
//  DashbordTab.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct DashbordTab: View {
    
    @EnvironmentObject var order: OrdersModel
    
    var body: some View {
        TabView {
            ListItems()
                .tabItem { Label("Home", systemImage: "house.fill") }
            Profile()
                .tabItem { Label("Profile", systemImage: "person.fill") }
            Orders()
                .tabItem { Label("Orders", systemImage: "bag.fill") }
                .badge(order.items.count)
        }
        .accentColor(.brandPrimary)
        .edgesIgnoringSafeArea(.all)
    }
}

