//
//  SwiftUI_Food_AppApp.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import SwiftUI

@main
struct SwiftUI_Food_AppApp: App {
     var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
