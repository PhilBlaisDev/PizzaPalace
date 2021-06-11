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
        }
        
        
    }
    
    
    fileprivate func leftSide() -> some View {
        return VStack(alignment: .leading){
            HStack{
                Button("Press to dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.title)
                .padding()
                .background(Color.black)
                Spacer(minLength: 40)
                Text("Some title")
                Spacer(minLength: 40)
                Text("Some button")
                Spacer(minLength: 40)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
