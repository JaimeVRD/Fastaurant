//
//  EditDrinks.swift
//  Fastaurant
//
//  Created by AltoMobile on 13/06/22.
//

import SwiftUI

struct EditDrinks: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var drink: FetchedResults<Drinks>.Element
    
    @State private var name = ""
    @State private var cash: Double = 0
    @State private var sold: Double = 0
    @State private var total: Double = 0
    
    var body: some View {
        
        Text("Edit item")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("MainOrange"))
        
        Form {
            Section {
                TextField("\(drink.name!)", text: $name)
                    .onAppear{
                        name = drink.name!
                        cash = drink.cash
                    }
                VStack{
                    Text("Value: $ \(Double(cash), specifier: "%.2f")")
                    Slider(value: $cash, in: 0...100, step: 0.01 )
                        .accentColor(Color("MainOrange"))
                    
                }.padding()
                
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

