//
//  DashbordTab.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct DashbordTab: View {
    var body: some View {
        TabView {
            ListItems()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Profile()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            Orders()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Orders")
                }
        }
        .accentColor(Color("PrimaryColour"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    DashbordTab()
}
