//
//  Table4.swift
//  Fastaurant
//
//  Created by AltoMobile on 07/07/22.
//

import SwiftUI
import CoreData

struct Table4 : View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(entity: Drinks.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var drink: FetchedResults<Drinks>
    
    @State private var soldFour: Double = 0
    @State private var soldFourT: Double = 0
    @State private var showingAlert = false
    @State private var showingReset = false
    
    var body: some View{
        NavigationView{
            
            VStack{
                
                Text("Total: $ \(totalT4(), specifier: "%.2f")")
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
                            
                            toSummary4()
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
                            
                            resetValue4()
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
                                EditTable4(drink: drink)){
                                    HStack{
                                        VStack(alignment: .leading, spacing: 6){
                                            
                                            Text(drink.name!).bold()
                                            
                                            Text("$ \(Double(drink.cash), specifier: "%.2f")")
                                            
                                            Text("# Sold: \(Int(drink.soldFour))")
                                            
                                            Text("Total: $\(drink.soldFour * drink.cash, specifier: "%.2f")")
                                                .font(.body)
                                                .fontWeight(.medium)
                                                .foregroundColor(
                                                    drink.soldFour == 0 ? Color(.gray) : Color(.green))
                                            
                                        }
                                    }
                                }
                    }
                }.listStyle(.plain)
                
            }.navigationTitle("Table 4")
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
    
    @discardableResult func toSummary4() -> Double{
        
        let valueSum4 : Double = 0
        
        for item in drink{
            
            item.soldFourT =  item.soldFourT + item.soldFour
            item.totalFour = item.soldFourT * item.cash
            item.soldFour = 0
            
        }
        save(context: managedObjContext)
        return valueSum4
    }
    
    private func totalT4() -> Double{
        
        var valueTotal: Double = 0
        
        for item in drink{
            valueTotal += item.soldFour * item.cash
        }
        return valueTotal
    }
    
    @discardableResult func resetValue4() -> Double{
        
        let reset1 : Double = 0
        
        for item in drink{
            
            item.soldFour = 0
            
        }
        save(context: managedObjContext)
        return reset1
    }
}

struct Table4_Previews: PreviewProvider {
    static var previews: some View {
        Table4()
    }
}
