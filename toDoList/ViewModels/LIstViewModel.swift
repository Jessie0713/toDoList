//
//  LIstViewModel.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/9/29.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items:[ItemModel] = []{
        didSet{
            saveItem()
        } //any time change functions
    } //從model來的
    let itemsKey:String = "item_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title:"回家",isCompleted: false),
//            ItemModel(title: "吃飯", isCompleted: true),
//            ItemModel(title: "出去玩", isCompleted: false)
//        ]
        
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{return} //gaurd let 前者為非才執行，if let 相反
        
        self.items = savedItems

    }
    func deleteItem(indexSet:IndexSet){
                items.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets:from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem )
        print("111")
    }    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey:itemsKey) //forKey is the data's name
        }
        
    }
}
