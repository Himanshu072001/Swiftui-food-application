//
//  ContentView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            ///Tab-1
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ///Tab-2
            AppetizerAccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            ///Tab-3
            AppetizerOrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color.primaryGreen)
        
    }
}

#Preview {
    AppetizerTabView()
}
