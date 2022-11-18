//
//  Summary.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI
import CoreData

struct Summary: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Drinks.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var drink: FetchedResults<Drinks>
    
    @State var showingAlert = false
 /*   @State private var soldOneT: Double = 0
    @State private var soldOne: Double = 0
 */
    var body: some View {

        NavigationView {
             
                VStack{
                 
                    Divider().frame(height: 1).background(Color("MainOrange"))
                    
                   Text("Total Day: $ \(totalToday(), specifier: "%.2f")").font(.title3)
                        .fontWeight(.heavy)
                        .bold()
                        .padding([.leading, .trailing])
                       .foregroundColor(.green).clipShape(Rectangle()).cornerRadius(3.0)
    
                    Spacer()
                
                    Button(action:{
                        
                        showingAlert = true
                    
                    },label:{ Text("End Day").foregroundColor(.white).bold()
                    .padding()
                        .frame(width: UIScreen.main.bounds.width - 80)
                        .background(Color("MainOrange"))
                     .cornerRadius(8)
                    })
                     .alert(isPresented: $showingAlert){
                         Alert(title: Text("Are you sure you want to end this day?"),
                             message: Text("*All values will reset"),
                               primaryButton: .destructive(Text("Yes")){
                          
                             totalReset()
                             soldReset()
                         
                         }, secondaryButton: .cancel())
                     }
                   
                    Spacer()
                    
                           List{
                                
                                Text("MENU").fontWeight(.heavy).bold().padding(.horizontal)
                                
                                ForEach(drink){ drink in
            
                                         HStack{
                                             VStack(alignment: .leading, spacing: 6){
                                                 
                                                 Text(drink.name!).bold()
         
                                                 Text("Value: $ \(Double(drink.cash), specifier: "%.2f")")
                                                 
                                                 Text("# Total Sold: \(Int(drink.soldOneT + drink.soldTwoT + drink.soldThreeT + drink.soldFourT))")
                                                 
                                                 Text("Total: $\((drink.soldOneT + drink.soldTwoT + drink.soldThreeT + drink.soldFourT) * drink.cash, specifier: "%.2f")")
                                                     .font(.body)
                                                     .fontWeight(.medium)
                                                     .foregroundColor(
                                            drink.soldOneT + drink.soldTwoT + drink.soldThreeT + drink.soldFourT == 0 ? Color(.gray) :  Color(.green))
                                             }
                                             Spacer()
                                             
                                         }
                                  
                                }
                                 }
                  
                }.listStyle(.plain).navigationTitle("Summary")
                    .navigationBarTitleDisplayMode(.inline)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
   
    //MARK: functions to save and reset
    func save(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("si guardó")
        }catch{
            print("no guardó")
        }
    }
 //test
    func totalSold() -> Double{
      
      var valueTotalSold: Double = 0
      
      for item in drink{
          valueTotalSold = item.soldOneT + item.soldTwoT + item.soldThreeT + item.soldFourT
      }
      return valueTotalSold
  }
  //test
     func totalToday() -> Double{
       
       var valueTotal: Double = 0
       
       for item in drink{
           valueTotal += item.totalOne + item.totalTwo + item.totalThree + item.totalFour
       }
       return valueTotal
   }
   
    @discardableResult func soldReset() -> Double{
       
        let valueReset : Double = 0
       
       for item in drink{
           item.soldOneT = 0
           item.soldTwoT = 0
           item.soldThreeT = 0
           item.soldFourT = 0
       }
       save(context: context)
       return valueReset
   }
   
    @discardableResult func totalReset() -> Double{
        
         let valueReset: Double = 0
        
        for item in drink{
            
            item.totalOne = 0
            item.totalTwo = 0
            item.totalThree = 0
            item.totalFour = 0
        }
        save(context: context)
        return valueReset
    }
    
        }

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Summary()
                         
        }
    }
}
