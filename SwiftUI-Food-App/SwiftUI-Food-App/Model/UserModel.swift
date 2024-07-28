//
//  UserModel.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 28/07/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var dob = Date()
    var extraNapkins: Bool = false
    var refills: Bool = false
}
