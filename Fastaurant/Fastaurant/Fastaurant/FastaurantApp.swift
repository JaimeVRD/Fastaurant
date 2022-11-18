//
//  FastaurantApp.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI

@main
struct FastaurantApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        
    }
}
