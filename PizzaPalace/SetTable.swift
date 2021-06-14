//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct PlacedOrder {
    var category = "Pizza"
    var subBategory = "12\" Medium"
    var product = "Pepperoni"
    var price = 12.00
}


struct SetTable: View {
    @Binding var displayViewId: Int
    @Environment(\.managedObjectContext) private var viewContext
    private let squareDimension:CGFloat = 67.0
    private let btnFontSize:CGFloat = 12
    private let categoryList = ["Pizza", "Appetizers", "Sides", "Salads", "Drinks", "Desserts", "Pasta"]
    
    private let pizzaSubCategoryList = ["10\" \nSmall", "12\" \nMedium", "14\" \nLarge", "16 \" \nX-Large", "24\" \nXX-Large"]
    private let appiSubCategoryList = ["Wings", "Fries", "Nachos", "Hummus plate", "Pickles", "Olives", "Fried Calamari"]
    private let sidesSubCategoryList = ["Fries", "Salad", "", "", "", "", "", "", "", ""]
    private let saladsSubCategoryList = ["Caesar", "Garden", "Chicken", "Greek", "Beet", "Potato"]
    private let drinksSubCategoryList = ["Beer", "Wine", "Soft Drink", "Juice", "Water"]
    private let dessertsSubCategoryList = ["Pie", "Cake", "Mousse", "Pudding"]
    private let pastaSubCategoryList = ["Fettuccine", "Lasagna", "Fusilli", "", "", "", "", "", ""]

    private let pizzaProductList = ["Cheese", "Pepperoni", "Veggie", "Hawaiian", "All Dressed", "Meat Lovers"]
    private let appiProductList = [""]
    private let sidesProductList = [""]
    private let saladsProductList = [""]
    private let drinksProductList = [""]
    private let dessertsProductList = [""]
    private let pastaProductList = [""]

    
    
    
    var body: some View {
        
        HStack(spacing:0){
            leftSide()
            rightSide()
        }.background(Color.white)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                        Button(action: {
                            self.displayViewId = 1
                        }) {
                            Label("Back", systemImage: "chevron.left")
                        }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
           }
            ToolbarItem(placement: .navigation) {
                Text("Take Out Order 72").padding(.leading, 120)
            }
            
            ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.displayViewId = 1
                    }) {
                        Label("Back 3", systemImage: "magnifyingglass")
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
            }
            ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.displayViewId = 1
                    }) {
                        Label("Back 3", systemImage: "escape")
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
            }
        }
    }
    
    fileprivate func leftSide() -> some View {
        return VStack(alignment: .center){
            HStack{
                Button(action: {


                }) {
                    Label("Beatrice Lestrange", systemImage: "person.circle")
                }.buttonStyle(PlainButtonStyle())

                
                Spacer()

                Button(action: {

                }) {
                    Image(systemName: "ellipsis")
                }.buttonStyle(PlainButtonStyle())
            }.padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 10)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("16\" Margherita").bold().font(.title3).frame(width:180, alignment: .leading)
                        Text("Mozarella").padding(.leading, 20)
                        Text("Onion").padding(.leading, 20)
                        Text("Capicollo").padding(.leading, 20)
                        Text("Basil").padding(.leading, 20)
                        Text("Parmeggiano").padding(.leading, 20)
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        HStack{
                            Spacer()
                            Text("1").bold().font(.title3).padding(.leading, 16)
                            Spacer()
                            Text("$12.00").bold().font(.title3)
                        }
                        HStack{
                            Spacer()
                            Text("1")
                            Spacer()
                            Text("$0.00")
                        }
                        HStack{
                            Spacer()
                            Text("1")
                            Spacer()
                            Text("$0.00")
                        }
                        HStack{
                            Spacer()
                            Text("1")
                            Spacer()
                            Text("$2.00")
                        }
                        HStack{
                            Spacer()
                            Text("1")
                            Spacer()
                            Text("$0.00")
                        }
                        HStack{
                            Spacer()
                            Text("1")
                            Spacer()
                            Text("$1.25")
                        }
                    }
                }.padding()
                
                Divider()
                HStack{
                    Text("Ginger Ale").bold().font(.title3).frame(width:180, alignment: .leading)
                    Spacer()
                    Text("1").bold().font(.title3).padding(.leading, 16)
                    Spacer()
                    Text("$1.95").bold().font(.title3)
                }.padding()
                Divider()

                HStack{
                    Text("Caesar").bold().font(.title3).frame(width:180, alignment: .leading)
                    Spacer()
                    Text("1").bold().font(.title3).padding(.leading, 16)
                    Spacer()
                    Text("$5.49").bold().font(.title3)
                }.padding()
                Divider()
                HStack{
                    Text("Fries").bold().font(.title3).frame(width:180, alignment: .leading)
                    Spacer()
                    Text("1").bold().font(.title3).padding(.leading, 16)
                    Spacer()
                    Text("$3.49").bold().font(.title3)

                }.padding()
                
            }.background(Color.white)
            Spacer().background(Color.white)
            
            HStack(alignment: .bottom){
                Spacer()
                VStack(alignment: .leading){
                    Text("Discounts:")
                    Text("Sub Total:")
                    Text("Surcharge:")
                    Text("Tax:")
                }.padding()
                
                VStack(alignment: .trailing){
                    Text("$0.00")
                    Text("$27.68")
                    Text("$0.00")
                    Text("$2.67")
                }.padding()
            }
            Divider()
            HStack{
                Button(action: {


                }) {
                    Text("Cancel")
                }.buttonStyle(BlackButtonStyle())
                
                Button(action: {


                }) {
                    Text("Hold")
                }.buttonStyle(BlackButtonStyle())
                
                Button(action: {


                }) {
                    Text("Send")
                }.buttonStyle(BlackButtonStyle())
                
                Spacer()
                HStack{
                    Text("Total: ").bold().font(.headline)
                    Text("$30.35").bold().font(.headline)
                }.padding()
                
            }.padding(.horizontal, 20)
            .padding(.top, 10)

            HStack{
                Button(action: {

                }) {
                    VStack{
                        Image(systemName: "number").resizable().frame(width: 18.0, height: 18.0)
                        Text("Quantity").font(.subheadline)
                    }
                }.buttonStyle(PlainButtonStyle())
                .padding()
                Button(action: {

                }) {
                    VStack{
                        Image(systemName: "plus").resizable().frame(width: 18.0, height: 18.0)
                        Text("Add Extra Item").font(.subheadline)
                    }
                    

                }.buttonStyle(PlainButtonStyle())
                .padding()
                Button(action: {

                }) {
                    VStack{
                        Image(systemName: "percent").resizable().frame(width: 18.0, height: 18.0)
                        Text("Discount Order").font(.subheadline)
                    }
                    

                }.buttonStyle(PlainButtonStyle())
                        .padding()
                Button(action: {

                }) {
                    VStack{
                        Image(systemName: "ticket").resizable().frame(width: 26.0, height: 18.0)
                        Text("Dining Option").font(.subheadline)
                    }
                    

                }.buttonStyle(PlainButtonStyle())
                        .padding()
                Spacer()
                Image(systemName: "chevron.right")
                Button(action: {

                }) {
                    VStack{
                        Text("$30.35").font(.title)
                        Text("Pay").font(.subheadline)
                    }
                }.buttonStyle(BlackButtonStyle())
            }
            .padding(10)
        }
        .background(Color.init(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.6))
        .background(Color.gray.shadow(radius: 5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    fileprivate func rightSide() -> some View {
        return VStack(alignment: .leading, spacing: 0){
            Text("Category").font(.headline)
                .padding(.horizontal, 20)
                .padding(.top, 20)
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
                        .padding(.leading, item == 0 ? 10 : 0)
                    }
                }
            }
            Text("Sub Category").font(.headline).padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:0){
                    ForEach(0 ..< pizzaSubCategoryList.count){ item in
                        Button(action: {
                            
                        }, label: {
                            Text(pizzaSubCategoryList[item])
                                .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                                .padding()
                                .font(.system(size: btnFontSize))
                                .multilineTextAlignment(.center)
                        })
                        .buttonStyle(SmallSquareButtonStyle())
                        .padding(.leading, item == 0 ? 10 : 0)
                    }
                }
            }
            Text("Products").font(.headline).padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:0){
                    ForEach(0 ..< pizzaProductList.count){ item in
                        Button(action: {
                            
                        }, label: {
                            Text(pizzaProductList[item])
                                .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                                .padding()
                                .font(.system(size: btnFontSize))
                                .multilineTextAlignment(.center)
                        })
                        .buttonStyle(SmallSquareButtonStyle())
                        .padding(.leading, item == 0 ? 10 : 0)
                    }
                }
            }
            Spacer()
        }
    }
}

struct SmallSquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label.padding(3)
            .background(!configuration.isPressed ?
                            Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.3):
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 0.3)
                            )
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(3)
            .padding(3)
    }
}

struct BlackButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label.padding()
            .background(!configuration.isPressed ?
                            Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 1.0):
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 1.0)
                            )
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(5)
            .padding(5)
    }
}


