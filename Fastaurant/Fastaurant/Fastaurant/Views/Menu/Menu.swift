//
//  Menu.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                //Main body
                Divider().frame(height: 1).background(Color("MainOrange"))
                
                Spacer()
                
                DrinksCategory()
                Spacer()
                
            }.navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.inline)
            
        }.accentColor(Color("MainOrange"))
            .navigationViewStyle(.stack)
            .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
        
    }
}

