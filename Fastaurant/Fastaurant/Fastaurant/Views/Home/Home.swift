//
//  Home.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI
import CoreData

struct Home: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(entity: Drinks.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var drink: FetchedResults<Drinks>
    
    @State private var showingAddView = false
    
    var body: some View{
        
        NavigationView{
            
            VStack{
                
                Divider().frame(height: 1).background(Color("MainOrange"))
                
                Text("Tap to add sold")
                    .bold().padding(.vertical).foregroundColor(.black)
                
                ButtonTables()
                
            }.navigationTitle("Tables")
                .navigationBarTitleDisplayMode(.inline)
            
        }.navigationViewStyle(.stack)
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor(Color("MainOrange"))
        
    }
}

struct Home_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Home()
        
    }
}
