//
//  AppetizerAcountView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerAccountView: View {
    @StateObject var viewModel = AccountsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.dob,
                               displayedComponents: .date)
                    Button {
                        viewModel.saveUserInfo()
                    } label: {
                         Text("Save Changes")
                            .foregroundColor(.primaryGreen)
                    }
                }
                
                Section(header: Text("REQUESTS")) {
                    Toggle("Extra Napkins",
                           isOn: $viewModel.user.extraNapkins)
                        .tint(.primaryGreen)
                    Toggle("Frequent Refills",
                           isOn: $viewModel.user.refills)
                        .tint(.primaryGreen)
                }
            }
            .navigationTitle("👨‍💼 Account")
        }
        .onAppear() {
            viewModel.getUserInfo()
        }
        .alert(item: $viewModel.alertItem ){alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}

#Preview {
    AppetizerAccountView()
}
