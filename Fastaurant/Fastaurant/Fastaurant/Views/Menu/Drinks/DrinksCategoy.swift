//
//  DrinkCategoyTest.swift
//  Fastaurant
//
//  Created by AltoMobile on 09/06/22.
//

import SwiftUI
import CoreData

struct DrinksCategory : View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(entity: Drinks.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var drink: FetchedResults<Drinks>
    
    @State private var showingAddView = false
    
    var body: some View{
        NavigationView{
            VStack(alignment: .leading){
                
                Text("Tap + to add new item")
                    .bold().padding(.horizontal).foregroundColor(.gray)
                
                Text("Tap item to edit")
                    .bold().padding(.horizontal).foregroundColor(.gray)
                
                List{
                    ForEach(drink){ drink in
                        NavigationLink(
                            destination: EditDrinks(drink: drink) ){
                                HStack{
                                    VStack(alignment: .leading, spacing: 6){
                                        
                                        Text(drink.name!).bold()
                                        
                                        Text("$ \(Double(drink.cash), specifier: "%.2f")")
                                        
                                    }
                                    Spacer()
                                }
                            }
                    }.onDelete(perform: deleteDrink)
                }.listStyle(.plain)
                
            }.navigationTitle("Add your own MENU")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            showingAddView.toggle()
                        }label: {
                            Label("", systemImage: "plus.circle").foregroundColor(Color("MainOrange"))
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton().foregroundColor(Color("MainOrange"))
                    }
                }.sheet(isPresented: $showingAddView){
                    AddDrinks()
                }
        }.navigationViewStyle(.stack)
        
    }
    
    private func deleteDrink(offsets: IndexSet){
        withAnimation{
            offsets.map { drink[$0] }.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
        }
    }
}

struct DrinkCategoyTest_Previews: PreviewProvider {
    static var previews: some View {
        DrinksCategory()
    }
}
