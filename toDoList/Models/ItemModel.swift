//
//  ItemModel.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/9/29.
//

import Foundation

struct ItemModel: Identifiable, Codable { //encode decode 用
    let id: String 
    let title: String
    let isCompleted:Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion()-> ItemModel{
        return ItemModel(id: id, title: title, isCompleted:  !isCompleted)
    }
}
