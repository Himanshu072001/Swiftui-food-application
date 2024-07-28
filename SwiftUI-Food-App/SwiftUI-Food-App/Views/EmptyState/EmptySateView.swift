//
//  EmptySateView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 28/07/24.
//

import SwiftUI

struct EmptySateView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.top, 32)
            }
            
        }
    }
}

#Preview {
    EmptySateView(title: "You havent added any appetizer yet, So add you appetizer before it get finished",
                  imageName: "empty-order")
}
