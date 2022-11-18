//
//  EditTables.swift
//  Fastaurant
//
//  Created by AltoMobile on 13/06/22.
//

import SwiftUI

struct EditTable1: View {
    
        
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
   
    
    var drink: FetchedResults<Drinks>.Element
    
    @State private var name = ""
    @State private var cash: Double = 0
    @State private var sold: Double = 0
    @State private var total: Double = 0
    
    var body: some View {
        
        Text("Add Total of items")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("MainOrange"))
        
        // Drinks
        Form {
            Section {
                Text("\(drink.name!)")
                    .onAppear{
                        name = drink.name!
                        cash = drink.cash
                        sold = drink.sold
                    }
       
                Text("Value: $ \(Double(cash), specifier: "%.2f")")
                 
               Stepper("Sold: # \(Int(sold))",
                       value: $sold, in: 0...100).foregroundColor(Color("MainOrange"))
                    
                            
                Spacer()
     
                HStack{
                    Spacer()
                    Button(action:{
                        DataController().editDrink(drink: drink,
                                                   name: name,
                                                   cash: cash,
                                                   sold: sold,
                                                   total: total,
                                                   context: managedObjContext)
                     
                        dismiss()
                        
                    },label:{ Text("Save").foregroundColor(.white).bold() }
                    ).padding()
                        .frame(width: UIScreen.main.bounds.width - 80)
                     .background(Color("MainOrange"))
                     .cornerRadius(8)
                }
            }
        }
    }
}


