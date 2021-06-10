//
//  ToobarItemPlacement.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

final class MenuItems: ObservableObject {
    @Published var allMenuItems: [ViewType] = [
        ViewType.init(type: "Quick Menu", order: 1, icon: "cursorarrow.click"),
        ViewType.init(type: "Orders", order: 2, icon: "text.badge.checkmark"),
        ViewType.init(type: "Sales", order: 3, icon: "dollarsign.circle.fill"),
        ViewType.init(type: "Inventory", order: 4, icon: "list.triangle"),
        ViewType.init(type: "Customers", order: 5, icon: "person.circle.fill"),
        ViewType.init(type: "Reservations", order: 6, icon: "tablecells.badge.ellipsis.fill"),
        ViewType.init(type: "Suppliers", order: 7, icon: "plus.square.fill"),
        ViewType.init(type: "Reports", order: 8, icon: "contextualmenu.and.cursorarrow"),
        ViewType.init(type: "Loyalty Program", order: 9, icon: "giftcard.fill"),
        ViewType.init(type: "Settings", order: 10, icon: "gear")
    ]
}

struct ToobarItemPlacement: View {
    @StateObject var menu = MenuItems()
    @State private var selectedMenuItem: String? = "Quick Menu"
    
    var body: some View {
        VStack{
            NavigationView {
               Sidebar(
                    menu: menu,
                    selectedMenuItem: $selectedMenuItem
               ).background(SwiftUI.Color.black.edgesIgnoringSafeArea(.all))
           }
        }
        .toolbar {
            Button(action: {
                
            }, label: {
                HStack(){
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color.white)
                    Text("My Profile").font(.headline)
                        .foregroundColor(Color.white)
                }
            })
        }.background(Color.black)
    }
}

struct ViewType: Identifiable, Hashable {
    let id = UUID()
    let type: String
    let order: Int
    let icon: String
}


struct Sidebar: View {
    @ObservedObject var menu: MenuItems
    @Binding var selectedMenuItem: String?

    var body: some View {
        VStack{
            Image("pizza")
                    .resizable()
                    .scaledToFit()
                .padding(.horizontal, 10)
                .padding(.top, 10)
            List {
                ForEach(menu.allMenuItems, id: \.self) { folder in
                    NavigationLink(
                        destination: FullView(type: folder.type)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .navigationTitle(selectedMenuItem ?? ""),
                        tag: folder.type,
                        selection: $selectedMenuItem
                    ) {
                        HStack{
                            Image(systemName: folder.icon)
                                .foregroundColor(Color.white)
                            Text(folder.type).font(.headline)
                                .foregroundColor(Color.white)
                                
                        }
                       
                    }
                    
                }
            }
            .padding(.vertical, 20)
            .listStyle(SidebarListStyle())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            
            Spacer()
            HStack{
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(Color.white)
                Text("Help").font(.headline)
                    .foregroundColor(Color.white)
                Spacer()
                    
            }.padding(20)
        }.background(Color.black)
    }
}

struct FullView: View {
    let type: String
    var body: some View {
        switch(type){
            case "Quick Menu": QuickMenu()
            case "Orders": Orders()
            case "Sales": Sales()
            case "Inventory": Inventory()
            case "Reservations": Inventory()
            case "Customers": Customers()
            case "Suppliers": Suppliers()
            case "Reports": Reports()
            case "Loyalty Program": CLDP()
            case "settings": Setup()
            default: Setup()
        }
    }
}

struct ToobarItemPlacement_Previews: PreviewProvider {
    static var previews: some View {
        ToobarItemPlacement()
    }
}

struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(12)
            
            // Indigo background color on release, yellow on press.
            .background(!configuration.isPressed ?
                Color.init(red: 218/255, green: 36/255, blue: 28/255) :
                            Color.init(red: 133/255, green: 194/255, blue: 39/255))
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(8)
    }
}



