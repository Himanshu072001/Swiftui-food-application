//
//  AppetizerOrderView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerOrderView: View {
    @EnvironmentObject var orderList : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderList.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            orderList.remove(indexSet)
                        })
                    }
                    
                    Button {
                        
                    } label: {
                        OrderButton(price: orderList.totalPrice, isFromOrder: true)
                    }
                }
                
                if orderList.items.isEmpty {
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
