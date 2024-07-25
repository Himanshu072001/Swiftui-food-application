//
//  AppetizerViewModel.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import Foundation

final class AppetizerViewModel : ObservableObject {
    
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    
    func getAppetizerFromServer() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                    case .success(let foodlist):
                        appetizers = foodlist
                    case.failure(let error):
                        print(error.localizedDescription)
                        switch error {
                            case .invalidData:
                                alertItem = AlertContext.invalidData
                            case .invalidResponse:
                                alertItem = AlertContext.invalidResponse
                            case .invalidURL:
                                alertItem = AlertContext.invalidURL
                            default:
                                alertItem = AlertContext.unableToComplete
                        }
                }
            }
        }
    }
    
    
}
