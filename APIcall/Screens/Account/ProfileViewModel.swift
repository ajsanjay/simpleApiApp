//
//  ProfileViewModel.swift
//  APIcall
//
//  Created by jay sabeen on 29/12/23.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = UserModel()
    @Published var alertItem: AlertItem?
    
//    @Published var firstName = ""
//    @Published var lastName = ""
//    @Published var eMail = ""
//    @Published var birthDay = Date()
//    @Published var extraNapkin = false
//    @Published var frequentRefill = false
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaved
        } catch {
            alertItem = AlertContext.userError
        }
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            alertItem = AlertContext.userError
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.eMail.isEmpty else {
            alertItem = AlertContext.mandatoryInfo
            return false
        }
        guard user.eMail.isValidEmail else {
            alertItem = AlertContext.emailNotValid
            return false
        }
        return true
    }
    
}
