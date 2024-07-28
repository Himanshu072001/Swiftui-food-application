//
//  DetailView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 26/07/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerImage(imageUrl: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(height: 240)
            
            DetailsView(appetizer: appetizer)
            Spacer()
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
                OrderButton(price: appetizer.price)
            }
            

            
        }
        .frame(width: 320, height: 540, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height:  30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
                    
            }
            
            
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer,
               isShowingDetailView: .constant(true))
}

struct ComponentView: View {
    var title: String
    var subTittle: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.black)
                .opacity(0.7)
            Text("\(subTittle)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.gray)
        }
    }
}

struct DetailsView: View {
    var appetizer: Appetizer
    
    var body: some View {
        VStack() {
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 36) {
                ComponentView(title: "Calories", subTittle: appetizer.calories)
                ComponentView(title: "Carbs", subTittle: appetizer.carbs)
                ComponentView(title: "Protien", subTittle: appetizer.protein)
            }
        }
    }
}

struct OrderButton: View {
    var price : Double
    var isFromOrder: Bool = false
    
    var body: some View {
        Text(isFromOrder
             ? "$\(price,  specifier: "%.2f") - Place Order"
             : "$\(price,  specifier: "%.2f") - Add To Order")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 300, height: 54)
            .background(.greenPrimary)
            .cornerRadius(8)
            .padding(.bottom, 36)
    }
}
