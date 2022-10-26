//
//  ListRowView.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/9/27.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    //static 1.在model宣告常數 2.在 preview 裡宣告 static 常數製造假資料
    static var item1 = ItemModel(title: "吃飯", isCompleted: false)
    static var item2 = ItemModel(title: "睡覺", isCompleted:true)
    static var previews: some View {
        Group{
            ListRowView(item:item1)
            ListRowView(item:item2)
            
        }
        .previewLayout(.sizeThatFits)
    }
}
