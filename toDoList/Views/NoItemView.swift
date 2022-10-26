//
//  NoItemView.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/10/3.
//

import SwiftUI

struct NoItemView: View {
    @State var animate:Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("沒有待做事項")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("別偷懶啊，快快騙自己會努力，稍稍往財務自由邁進一小步就好🤩😜")
                    .padding(.bottom,20)
                NavigationLink(destination: AddView(), label: {
                    Text("邁出第一步🚶🏻")
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .font(.headline)
                        .background(animate ? secondaryAccentColor:Color.accentColor)
                        .cornerRadius(10)
                })
                
                .padding(.horizontal, animate ? 30:50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius:animate ? 30 : 10,
                        x: 0,  
                        y: animate ? 15:10)
                .offset( y: animate ? -7:0)
                .scaleEffect(animate ? 1.1:1)
            }
            .frame(maxWidth:400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
           
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{ return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
              Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                    animate.toggle()
                }
        }
    }
}



struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle("標題")
        }
        
    }
}
