//
//  APIcallApp.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

@main
struct APIcallApp: App {
    
    var order = OrdersModel()
    
    var body: some Scene {
        WindowGroup {
            DashbordTab().environmentObject(order)
        }
    }
}
