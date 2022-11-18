//
//  Main.swift
//  Fastaurant
//
//  Created by AltoMobile on 23/05/22.
//

import SwiftUI

struct Main: View {
    var body: some View {
        
        TabView{
            
            Menu().tabItem {
                Image(systemName: "tablecells")
                Text("Menu")
            }
            
            Home().tabItem {
                Image(systemName: "house")
                Text("Tables")
            }
            
            Summary().tabItem {
                Image(systemName: "list.star")
                Text("Summary")
            }
            
        }.accentColor(.white)
        
    }
    
    //change color of Tab bar
    init(){
        
        UITabBar.appearance().backgroundColor = UIColor(Color("ToolBar"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        //UITabBar.appearance().isTranslucent = true
        
        UITabBar.appearance().barTintColor = UIColor(Color("ToolBar"))
        
        
        print("Int home view")
        
    }
    
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
