//
//  ApptizerListViewModel.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import Foundation

final class ApptizerListViewModel: ObservableObject {
    
    @Published var apptizers: [Apptizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedApptizer: Apptizer?
    
    func getApptizers() {
        isLoading = true
        GetApptizerAPI().getApptizerList(completion: { [weak self] listResp, error in
            guard let weakSelf = self else { return }
            weakSelf.isLoading = false
            guard error == nil else {
                print("From main class Error",error?.message ?? "")
                weakSelf.alertItem = AlertContext.invalidError
                return
            }
            guard let listValues = listResp else { return }
            DispatchQueue.main.async {
                weakSelf.apptizers = listValues.request
            }
        })
    }
    
}
