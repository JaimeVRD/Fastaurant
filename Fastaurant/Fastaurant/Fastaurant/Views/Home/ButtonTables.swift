//
//  ButtonTables.swift
//  Fastaurant
//
//  Created by AltoMobile on 11/07/22.
//

import SwiftUI

struct ButtonTables: View {
    
    var body: some View {
        
        ScrollView {
            VStack{
                
                ButtonTable1().padding(.bottom)
                
                ButtonTable2().padding(.bottom)
                
                ButtonTable3().padding(.bottom)
                
                ButtonTable4().padding(.bottom)
                /*
                 ButtonTable5().padding(.bottom)
                 
                 ButtonTable6().padding(.bottom)
                 
                 ButtonTable7().padding(.bottom)
                 
                 ButtonTable8().padding(.bottom)
                 
                 ButtonTable9().padding(.bottom)
                 
                 ButtonTable10().padding(.bottom)
                 */
            }
            
        }
    }
}

struct ButtonTable1 : View{
    
    @State var isTable1Active: Bool = false
    
    var body: some View{
        
        Button(action: {isTable1Active = true} , label: {
            
            Text("Table 1")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color("MainOrange"))
                .cornerRadius(8)
            
        })
        
        NavigationLink(
            destination: Table1(),
            isActive: $isTable1Active,
            label: {EmptyView()})
    }
}

struct ButtonTable2 : View{
    
    @State var isTable2Active: Bool = false
    
    var body: some View{
        
        Button(action: {isTable2Active = true} , label: {
            
            Text("Table 2")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color("MainOrange"))
                .cornerRadius(8)
            
        })
        
        NavigationLink(
            destination: Table2() ,
            isActive: $isTable2Active,
            label: {EmptyView()})
    }
}

struct ButtonTable3 : View{
    
    @State var isTable3Active: Bool = false
    
    var body: some View{
        
        Button(action: {isTable3Active = true} , label: {
            
            Text("Table 3")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color("MainOrange"))
                .cornerRadius(8)
        })
        
        NavigationLink(
            destination: Table3(),
            isActive: $isTable3Active,
            label: {EmptyView()})
    }
}

struct ButtonTable4 : View{
    
    @State var isTable4Active: Bool = false
    
    var body: some View{
        
        Button(action: {isTable4Active = true} , label: {
            
            Text("Table 4")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color("MainOrange"))
                .cornerRadius(8)
        })
        
        NavigationLink(
            destination: Table4(),
            isActive: $isTable4Active,
            label: {EmptyView()})
    }
}
/*
 struct ButtonTable5 : View{
 
 @State var isTable5Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable5Active = true} , label: {
 
 Text("Table 5")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table5(),
 isActive: $isTable5Active,
 label: {EmptyView()})
 }
 }
 
 struct ButtonTable6 : View{
 
 @State var isTable6Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable6Active = true} , label: {
 
 Text("Table 6")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table6(),
 isActive: $isTable6Active,
 label: {EmptyView()})
 }
 }
 
 struct ButtonTable7 : View{
 
 @State var isTable7Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable7Active = true} , label: {
 
 Text("Table 7")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table7(),
 isActive: $isTable7Active,
 label: {EmptyView()})
 }
 }
 
 struct ButtonTable8 : View{
 
 @State var isTable8Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable8Active = true} , label: {
 
 Text("Table 8")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table8(),
 isActive: $isTable8Active,
 label: {EmptyView()})
 }
 }
 
 struct ButtonTable9 : View{
 
 @State var isTable9Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable9Active = true} , label: {
 
 Text("Table 9")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table9(),
 isActive: $isTable9Active,
 label: {EmptyView()})
 }
 }
 
 struct ButtonTable10 : View{
 
 @State var isTable10Active: Bool = false
 
 var body: some View{
 
 Button(action: {isTable10Active = true} , label: {
 
 Text("Table 10")
 .font(.title3)
 .fontWeight(.heavy)
 .foregroundColor(.white)
 .padding()
 .frame(width: UIScreen.main.bounds.width - 50)
 .background(Color("MainOrange"))
 .cornerRadius(8)
 })
 
 NavigationLink(
 destination: Table10(),
 isActive: $isTable10Active,
 label: {EmptyView()})
 }
 }
 */

struct ButtonTables_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTables()
    }
}

