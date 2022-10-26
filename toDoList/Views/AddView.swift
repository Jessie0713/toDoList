//
//  AddView.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/9/27.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack{
            TextField("在這裡輸入東東歐～",text: $textFieldText)
                    .padding()
                .frame(height:55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                
                
                Button(action:saveButtomPressed,label:{
                    Text("送出")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
        }
            .padding(14)
        }
        .navigationTitle("想幹嘛？？🙋🏻‍♀️")
        .alert(isPresented: $showAlert, content:getAlert)
        
    }
    func saveButtomPressed(){
        if textIsAppropriate(){
        listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if(textFieldText.count < 3){
            alertTitle = "內容須超過三個字元🤗"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            
        }
       
    }
}
