//
//  AppetizerCell.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

struct AppetizerCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerImage(imageUrl: appetizer.imageURL)
                .frame(width: 132, height: 96)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.7)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
        }
    }
}
