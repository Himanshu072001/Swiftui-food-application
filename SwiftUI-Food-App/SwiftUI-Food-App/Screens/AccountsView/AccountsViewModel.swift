//
//  AccountsViewModel.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 28/07/24.
//

import SwiftUI

final class AccountsViewModel: ObservableObject {
    @AppStorage("user") private var userModel: Data?
    @Published var user: User = User()
    @Published var alertItem: AlertItem?
    
    func saveUserInfo() {
        guard isValidForm else { return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userModel = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func getUserInfo() {
        guard let userData = userModel else { return }
        
        do {
            let data = try JSONDecoder().decode(User.self, from: userData)
            user = data
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty  && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        alertItem = AlertContext.userSaveSuccess
        return true
    }
}
