//
//  AppetizerListView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerViewModel()
    
    var body: some View {
        NavigationView {
            List( viewModel.appetizers, id: \.id) { appetizer in
                AppetizerCell(appetizer: appetizer)
            }
            .navigationTitle("🌮 Appetizers")
        }
        .onAppear {
            viewModel.getAppetizerFromServer()
        }
        .alert(item: $viewModel.alertItem ){alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}

#Preview {
    AppetizerListView()
}
