//
//  Order.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 28/07/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func add(_ appetizer : Appetizer) {
        items.append(appetizer)
    }
    
    func remove(_ indexSet: IndexSet) {
        !(items.isEmpty) 
        ? items.remove(atOffsets: indexSet)
        : print("No more items to delete")
    }
    
}
