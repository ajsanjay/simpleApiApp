//
//  CartButton.swift
//  APIcall
//
//  Created by jay sabeen on 29/12/23.
//

import SwiftUI

struct CartButton: View {
    let titele: LocalizedStringKey
    var body: some View {
        Text(titele)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color("PrimaryColour"))
            .cornerRadius(10)
    }
}

#Preview {
    CartButton(titele: "Add to Cart")
}
