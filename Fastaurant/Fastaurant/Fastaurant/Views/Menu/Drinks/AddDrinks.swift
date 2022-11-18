//
//  AddCategory1.swift
//  Fastaurant
//
//  Created by AltoMobile on 08/06/22.
//

import SwiftUI
import CoreData

struct AddDrinks: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var isDrinkNameEmpty = false
    @State private var name = ""
    @State private var cash: Double = 0
    @State private var sold: Double = 0
    @State private var cashCent: Double = 0
    @State private var cashDecimal: Double = 0
    @State private var cashOne: Double = 0
    
    var body: some View {
        Form{
            Section{
                
                Text("Add new item")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainOrange"))
                
                TextField("Menu name", text: $name)
                
                VStack{
                    Text("Value: $ \(Int(cash))")
                    Slider(value: $cash, in: 0...100, step: 1 ).accentColor(Color("MainOrange"))
                    
                }.padding()
                
                VStack{
                    Stepper("Adjust ¢ : \(cashDecimal, specifier: "%.2f")",
                            value: $cashDecimal,
                            in: 0...0.99,
                            step: 0.01){_ in
                        cashCent = cashOne + cashDecimal
                    }
                    
                }.padding()
                
                Button(action: {
                    
                    if name == "" {
                        isDrinkNameEmpty = true
                    } else {
                        
                        DataController().addDrink(name: name,
                                                  cash: cash, cashCent: cashCent,
                                                  sold: sold,               context: managedObjContext)
                        dismiss()
                    }
                },label:{ Text("Save").foregroundColor(.white).bold() }
                ).padding()
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("MainOrange"))
                    .cornerRadius(8)
                    .alert(isPresented: $isDrinkNameEmpty){
                        
                        Alert(title: Text("Error"), message: Text("Add food name"), dismissButton: .default(Text("OK")))
                        
                    }
            }
        }
    }
}

struct AddCategory1_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinks()
    }
}

