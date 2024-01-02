//
//  ListItems.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct ListItems: View {
    
    @StateObject var viewModel = ApptizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.apptizers) { apptizer in
                    ApptizerListCell(apptizer: apptizer)
//                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(.red)
                        .onTapGesture {
                            viewModel.selectedApptizer = apptizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("📋 Available Items")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
//                .padding(.leading, -20)
//                .padding(.trailing, -20)
//                .task {
//                    viewModel.getApptizers()
//                }
            }
            .onAppear() {
                viewModel.getApptizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            if viewModel.isLoading {
                loadingView()
            }
            if viewModel.isShowingDetail {
                ApptizerDetail(apptizer: viewModel.selectedApptizer ?? MockData.sampleApptizer, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    ListItems()
}
