//
//  ActivityIndicator.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

struct loadingView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(Color("PrimaryColour"))
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
}

struct ActivityIndicator: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
    
}

