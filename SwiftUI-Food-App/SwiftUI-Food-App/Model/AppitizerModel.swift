//
//  AppitizerModel.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import Foundation

// MARK: - Appetizer
struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Codable {
    let protein: Int
    let price: Double
    let name, description: String
    let imageURL: String
    let carbs, calories, id: Int
}


struct MockData {
    static let sampleAppetizer = Appetizer.init(protein: 10, price: 99.99,
                                                name: "Mango For Testing",
                                                description: "Good for making juice" ,
                                                imageURL: "",
                                                carbs: 10,
                                                calories: 90,
                                                id: 10)
    static let appetizer = [sampleAppetizer,
                            sampleAppetizer,
                            sampleAppetizer,
                            sampleAppetizer,
                            sampleAppetizer,
                            sampleAppetizer,
                            sampleAppetizer]
    
    static let sampleAppetizer1 = Appetizer.init(protein: 10, price: 19.99,
                                                name: "Mango For Testing",
                                                description: "Good for making juice" ,
                                                imageURL: "",
                                                carbs: 10,
                                                calories: 90,
                                                id: 10)
    static let sampleAppetizer2 = Appetizer.init(protein: 10, price: 29.99,
                                                name: "Mango For Testing",
                                                description: "Good for making juice" ,
                                                imageURL: "",
                                                carbs: 10,
                                                calories: 90,
                                                id: 11)
    static let sampleAppetizer3 = Appetizer.init(protein: 10, price: 9.99,
                                                name: "Mango For Testing",
                                                description: "Good for making juice" ,
                                                imageURL: "",
                                                carbs: 10,
                                                calories: 90,
                                                id: 11)
    
    static let appetizerSample = [sampleAppetizer1,
                                  sampleAppetizer2,
                                  sampleAppetizer3]
}
