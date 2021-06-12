//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct SetTable: View {
    @Binding var displayViewId: Int
    @Environment(\.managedObjectContext) private var viewContext
    private let squareDimension:CGFloat = 80.0
    private let btnFontSize:CGFloat = 14
    private let categoryList = ["Pizza", "Appetizers", "Sides", "Salads", "Drinks", "Desserts", "Pasta"]
    private let subCategoryList = ["10\" Small", "12\" Medium", "14\" Large", "16 \"X-Large", "24\" XX-Large"]
    private let productList = ["12 \" Cheese", "12\" Pepperoni", "12\" Veggie", "12\" Hawaiian", "14\" All Dressed", "14\" Meat Lovers"]
    
    var body: some View {
        
        HStack(spacing:0){
            leftSide()
            rightSide()
        }.background(Color.white)
        .navigationTitle("Back")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    self.displayViewId = 1
                }) {
                   Label("Back", systemImage: "chevron.left")
               }
           }
        }
    }
    
    fileprivate func leftSide() -> some View {
        return VStack(alignment: .leading){
            HStack{
                Text("Some title")
                Spacer()
                Text("Btn")
            }
            
            HStack{
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
                Text("Some title")
                Spacer()
                Text("Btn")
            }
            
            HStack{
                Text("Some title")
                Spacer()
                Text("Btn")
            }
        }
        .background(Color.init(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    fileprivate func rightSide() -> some View {
        return VStack(alignment: .leading, spacing: 0){
            Text("Category").font(.largeTitle).padding(.horizontal, 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:0){
                    ForEach(0 ..< categoryList.count){ item in
                        Button(action: {
                            
                        }, label: {
                            Text(categoryList[item])
                                .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                                .padding()
                                .font(.system(size: btnFontSize))
                                .multilineTextAlignment(.center)
                        })
                        .buttonStyle(SmallSquareButtonStyle())
                    }
                }
            }
            Text("Sub Category").font(.largeTitle).padding(.horizontal, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:0){
                    ForEach(0 ..< subCategoryList.count){ item in
                        Button(action: {
                            
                        }, label: {
                            Text(subCategoryList[item])
                                .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                                .padding()
                                .font(.system(size: btnFontSize))
                                .multilineTextAlignment(.center)
                        })
                        .buttonStyle(SmallSquareButtonStyle())
                    }
                }
            }
            Text("Products").font(.largeTitle).padding(.horizontal, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:0){
                    ForEach(0 ..< productList.count){ item in
                        Button(action: {
                            
                        }, label: {
                            Text(productList[item])
                                .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                                .padding()
                                .font(.system(size: btnFontSize))
                                .multilineTextAlignment(.center)
                        })
                        .buttonStyle(SmallSquareButtonStyle())
                    }
                }
            }
            Spacer()
        }
    }
}

struct SmallSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label.padding(5)
            .background(!configuration.isPressed ?
                            Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.4):
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 0.4)
                            )
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(5)
            .padding(5)
    }
}


