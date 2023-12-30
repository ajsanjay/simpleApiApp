//
//  XcloseButton.swift
//  APIcall
//
//  Created by jay sabeen on 29/12/23.
//

import SwiftUI

struct XcloseButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XcloseButton()
}
