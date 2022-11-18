//
//  ContentView.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    
    var body: some View {
        
        Main()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
