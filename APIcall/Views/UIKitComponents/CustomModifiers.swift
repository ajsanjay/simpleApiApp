//
//  CustomModifiers.swift
//  APIcall
//
//  Created by jay sabeen on 31/12/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color("PrimaryColour"))
            .controlSize(.large)
    }
    
}

extension View {
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
    
}
