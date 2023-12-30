//
//  ApptizerDetail.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

struct ApptizerDetail: View {
    
    @EnvironmentObject var order: OrdersModel
    
    let apptizer: Apptizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            ApptizerRemoteImage(urlString: apptizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(apptizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfoView(title: "Calories", value: apptizer.calories)
                    NutritionInfoView(title: "Carbs", value: apptizer.carbs)
                    NutritionInfoView(title: "Protein", value: apptizer.protein)
                }
            }
            Spacer()
            Button {
                order.add(apptizer)
                isShowingDetail = false
            } label: {
                CartButton(titele: "$ \(apptizer.price, specifier: "%.2f") - Add to order")
            }
            .padding(.bottom)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
//        .border(.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XcloseButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    ApptizerDetail(apptizer: MockData.sampleApptizer, isShowingDetail: .constant(false))
}

struct NutritionInfoView: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
        
    }
    
}
