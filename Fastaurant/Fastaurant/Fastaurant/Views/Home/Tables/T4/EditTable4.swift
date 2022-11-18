//
//  EditTable4.swift
//  Fastaurant
//
//  Created by AltoMobile on 07/07/22.
//

import SwiftUI

struct EditTable4: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var drink: FetchedResults<Drinks>.Element
    
    @State private var name = ""
    @State private var cash: Double = 0
    @State private var soldFour: Double = 0
    
    var body: some View {
        
        Text("Add Total of items")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("MainOrange"))
        
        // MENU
        Form {
            Section {
                Text("\(drink.name!)")
                    .onAppear{
                        name = drink.name!
                        cash = drink.cash
                        soldFour = drink.soldFour
                    }
                
                Text("Value: $ \(Double(cash), specifier: "%.2f")")
                
                Stepper("Sold: # \(Int(soldFour))",
                        value: $soldFour, in: 0...100).foregroundColor(Color("MainOrange"))
                
                Button(action:{
                    DataController().editDrink4(drink: drink,
                                                name: name,
                                                cash: cash,
                                                sold: soldFour,
                                                context: managedObjContext)
                    
                    dismiss()
                    
                },label:{ Text("Save in Table 4").foregroundColor(.white).bold() }
                ).padding()
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("MainOrange"))
                    .cornerRadius(8)
                
            }
        }
    }
}


