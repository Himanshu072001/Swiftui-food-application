//
//  AppetizerOrderView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerOrderView: View {
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.appetizers, id: \.id) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.appetizers.remove(atOffsets: indexSet)
                        })
                    }
                    
                    Button {
                        
                    } label: {
                        OrderButton(price: 36.0, isFromOrder: true)
                    }
                }
                
                if viewModel.appetizers.isEmpty {
                    EmptySateView(title: "You did not added any dish yet",
                                  imageName: "empty-order")
                }
                
            }
            
            .navigationTitle("💰 Orders")
        }
    }
}

#Preview {
    AppetizerOrderView()
}
