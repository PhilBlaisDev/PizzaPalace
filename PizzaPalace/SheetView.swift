//
//  SheetView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-10.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack{
            leftSide()
            rightSide()
        }.frame(width:1200, height: 800, alignment: .top)
    }
    
    
    fileprivate func leftSide() -> some View {
        return VStack(alignment: .leading){
            HStack{
                Button("X") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                
                Spacer()
                Text("Some title")
                Spacer()
                Text("Btn")
            }
            
            HStack{
                Button("X") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                
                Spacer()
                Text("Some title")
                Spacer()
                Text("Btn")
            }
            
            Spacer()
            Text("List")
            Spacer()
            Text("Total")
            Spacer()
            HStack{
                Button("X") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                
                Spacer()
                Text("Some title")
                Spacer()
                Text("Btn")
            }
            
            HStack{
                Button("X") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                
                Spacer()
                Text("Some title")
                Spacer()
                Text("Btn")
            }
        }
        .background(Color.init(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    fileprivate func rightSide() -> some View {
        return VStack(alignment: .leading){
            HStack{
                Button("Press to dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                .background(Color.black)
                Spacer()
                Text("Some title")
                Spacer()
                Text("Some button")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }

}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
