//
//  ApptizerListCell.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

struct ApptizerListCell: View {
    
    let apptizer: Apptizer
    
    var body: some View {
        HStack {
            ApptizerRemoteImage(urlString: apptizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8.0)
            VStack(alignment: .leading, spacing: 5) {
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(apptizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ApptizerListCell(apptizer: MockData.sampleApptizer)
}
