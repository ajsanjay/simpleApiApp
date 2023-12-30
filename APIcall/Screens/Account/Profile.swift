//
//  Profile.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct Profile: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personel Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .textContentType(.familyName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .textContentType(.middleName)
                    TextField("Email", text: $viewModel.user.eMail)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthDay, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkin)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefill)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                }
            }
            .navigationTitle("👤 My Profile")
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) {
            alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    Profile()
}
