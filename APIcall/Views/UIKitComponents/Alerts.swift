//
//  Alerts.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidError = AlertItem(title: Text("Invalid req"), message: Text("Invalid request"), dismissButton: .default(Text("Ok")))
    static let emailNotValid = AlertItem(title: Text("Email Validation !"), message: Text("Invalid email"), dismissButton: .default(Text("Ok")))
    static let mandatoryInfo = AlertItem(title: Text("Fill all Mandatory !"), message: Text("Mandatory field is left blank"), dismissButton: .default(Text("Ok")))
    static let userSaved = AlertItem(title: Text("Profile Updated 🥱"), message: Text("User profile info updated"), dismissButton: .default(Text("Ok")))
    static let userError = AlertItem(title: Text("Profile Error 😳"), message: Text("User profile info not updated"), dismissButton: .default(Text("Ok")))
}
