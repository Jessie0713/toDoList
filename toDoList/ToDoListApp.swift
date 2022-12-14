//
//  toDoListApp.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/9/27.
//

import SwiftUI

@main
struct toDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel =  ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) //for ipad
            .environmentObject(listViewModel)
           
        }
    }
}
