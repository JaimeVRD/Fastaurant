//
//  DataController.swift
//  Fastaurant
//
//  Created by AltoMobile on 07/06/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MenuCoreData")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("saved")
        }catch{
            print("unsaved")
        }
    }
    
    func addDrink(name: String, cash: Double, cashCent: Double, sold: Double, context: NSManagedObjectContext){
        let newDrink = Drinks(context: context)
        newDrink.id = UUID()
        newDrink.name = name
        newDrink.cash = cash + cashCent
        newDrink.sold = sold
        
        save(context: context)
    }
    
    func editDrink(drink: Drinks, name: String, cash: Double, sold: Double, total: Double, context: NSManagedObjectContext){
        drink.name = name
        drink.cash = cash
        drink.sold = sold
        // drink.total = drink.cash * drink.sold
        
        save(context: context)
        
    }
    
    func editDrink1(drink: Drinks, name: String, cash: Double, sold: Double, context: NSManagedObjectContext){
        drink.name = name
        drink.cash = cash
        drink.soldOne = sold
        
        save(context: context)
        
    }
    
    func editDrink2(drink: Drinks, name: String, cash: Double, sold: Double, context: NSManagedObjectContext){
        drink.name = name
        drink.cash = cash
        drink.soldTwo = sold
        
        save(context: context)
        
    }
    
    func editDrink3(drink: Drinks, name: String, cash: Double, sold: Double, context: NSManagedObjectContext){
        drink.name = name
        drink.cash = cash
        drink.soldThree = sold
        
        save(context: context)
        
    }
    
    func editDrink4(drink: Drinks, name: String, cash: Double, sold: Double,context: NSManagedObjectContext){
        drink.name = name
        drink.cash = cash
        drink.soldFour = sold
        
        save(context: context)
        
    }
    
}



