//
//  Profile.swift
//  APIcall
//
//  Created by jay sabeen on 26/12/23.
//

import SwiftUI

struct Profile: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @FocusState private var focusedTextfield: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, eMail
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personel Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
//                        .textContentType(.familyName)
                        .focused($focusedTextfield, equals: .firstName)
                        .onSubmit { focusedTextfield = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
//                        .textContentType(.middleName)
                        .focused($focusedTextfield, equals: .lastName)
                        .onSubmit { focusedTextfield = .eMail }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.eMail)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedTextfield, equals: .eMail)
                        .onSubmit { focusedTextfield = nil }
                        .submitLabel(.return)
                    DatePicker("Birthday", 
                               selection: $viewModel.user.birthDay,
                               in: Date().oneHundredTenYrsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextfield = nil }
                }
            }
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
