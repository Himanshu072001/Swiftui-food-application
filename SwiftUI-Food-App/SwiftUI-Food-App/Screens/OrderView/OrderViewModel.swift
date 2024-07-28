//
//  OrderViewModel.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 28/07/24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var appetizers : [Appetizer] = MockData.appetizerSample
    @Published var totalPrice: Double = 0.0
    
}
