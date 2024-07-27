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
        ZStack {
            NavigationView {
                List( viewModel.appetizers, id: \.id) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetailView = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🌮 Appetizers")
                .disabled(viewModel.isShowingDetailView ? true : false)
            }
            .onAppear {
                viewModel.getAppetizerFromServer()
            }
            .blur(radius: viewModel.isShowingDetailView ? 30 : 0)
            
            if viewModel.isShowingDetailView {
                DetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                           isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
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
