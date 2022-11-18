//
//  Table2.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/06/22.
//

import SwiftUI
import CoreData

struct Table2 : View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(entity: Drinks.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var drink: FetchedResults<Drinks>
    
    @State private var soldTwo: Double = 0
    @State private var soldTwoT: Double = 0
    @State private var showingAlert = false
    @State private var showingReset = false
    
    var body: some View{
        NavigationView{
            
            VStack{
                
                Text("Total: $ \(totalT2(), specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .bold()
                    .foregroundColor(.green)
                
                HStack {
                    
                    //MARK: Summary
                    Button(action:{
                        
                        showingAlert = true
                        
                    },label:{ Text("To Summary")
                            .foregroundColor(.white).bold()
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color("GreenL"))
                            .cornerRadius(8)
                    })
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("Are you sure?"),
                              message: Text("*Save to the final summary, all values in this Table will reset"),
                              primaryButton: .destructive(Text("Yes")){
                            
                            toSummary2()
                            dismiss()
                            
                        }, secondaryButton: .cancel())
                    }.padding(.horizontal)
                    
                    //MARK: Reset
                    Button(action:{
                        
                        showingReset = true
                        
                    },label:{ Text("Reset")
                            .foregroundColor(.white).bold()
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color(.red))
                            .cornerRadius(8)
                    })
                    .alert(isPresented: $showingReset){
                        Alert(title: Text("Are you sure?"),
                              message: Text("*All values in this Table will RESET"),
                              primaryButton: .destructive(Text("Yes")){
                            
                            resetValue2()
                            //   dismiss()
                            
                        }, secondaryButton: .cancel())
                    }
                    
                }
                Text("Tap item to add # sold")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                
                List{
                    Text("MENU")
                        .fontWeight(.heavy)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(drink){ drink in
                        
                        NavigationLink(
                            destination:
                                EditTable2(drink: drink)){
                                    HStack{
                                        VStack(alignment: .leading, spacing: 6){
                                            
                                            Text(drink.name!).bold()
                                            
                                            Text("$ \(Double(drink.cash), specifier: "%.2f")")
                                            
                                            Text("# Sold: \(Int(drink.soldTwo))")
                                            
                                            Text("Total: $\(drink.soldTwo * drink.cash, specifier: "%.2f")")
                                                .font(.body)
                                                .fontWeight(.medium)
                                                .foregroundColor(
                                                    drink.soldTwo == 0 ? Color(.gray) : Color(.green))
                                            
                                        }
                                    }
                                }
                    }
                }.listStyle(.plain)
                
                
            }.navigationTitle("Table 2")
                .navigationBarTitleDisplayMode(.inline)
            
        }.accentColor(Color("MainOrange"))
    }
    
    func save(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("saved")
        }catch{
            print("unsaved")
        }
    }
    
    @discardableResult func toSummary2() -> Double{
        
        let valueSum2 : Double = 0
        
        for item in drink{
            
            item.soldTwoT =  item.soldTwoT + item.soldTwo
            item.totalTwo = item.soldTwoT * item.cash
            item.soldTwo = 0
            
        }
        save(context: managedObjContext)
        return valueSum2
    }
    
    private func totalT2() -> Double{
        
        var valueTotal: Double = 0
        
        for item in drink{
            valueTotal += item.soldTwo * item.cash
        }
        return valueTotal
    }
    @discardableResult func resetValue2() -> Double{
        
        let reset2 : Double = 0
        
        for item in drink{
            
            item.soldTwo = 0
            
        }
        save(context: managedObjContext)
        return reset2
    }
}

struct Table2_Previews: PreviewProvider {
    static var previews: some View {
        Table2()
    }
}
