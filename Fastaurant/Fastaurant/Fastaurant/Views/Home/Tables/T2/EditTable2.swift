//
//  EditTable2.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/06/22.
//

import SwiftUI

struct EditTable2: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var drink: FetchedResults<Drinks>.Element
    
    @State private var name = ""
    @State private var cash: Double = 0
    @State private var soldTwo: Double = 0
    
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
                        soldTwo = drink.soldTwo
                    }
                
                Text("Value: $ \(Double(cash), specifier: "%.2f")")
                
                Stepper("Sold: # \(Int(soldTwo))",
                        value: $soldTwo, in: 0...100).foregroundColor(Color("MainOrange"))
                
                Button(action:{
                    DataController().editDrink2(drink: drink,
                                                name: name,
                                                cash: cash,
                                                sold: soldTwo,
                                                
                                                context: managedObjContext)
                    
                    dismiss()
                    
                },label:{ Text("Save in Table 2").foregroundColor(.white).bold() }
                ).padding()
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("MainOrange"))
                    .cornerRadius(8)
                
            }
        }
    }
}

