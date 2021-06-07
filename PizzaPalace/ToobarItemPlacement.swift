//
//  ToobarItemPlacement.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI

final class MenuItems: ObservableObject {
    @Published var allMenuItems: [ViewType] = [
        ViewType.init(type: "Quick Orders", order: 1, icon: "cursorarrow.click"),
        ViewType.init(type: "Sales", order: 2, icon: "dollarsign.circle.fill"),
        ViewType.init(type: "Inventory", order: 3, icon: "list.triangle"),
        ViewType.init(type: "Customers", order: 4, icon: "person.circle.fill"),
        ViewType.init(type: "Suppliers", order: 5, icon: "plus.square.fill"),
        ViewType.init(type: "Reports", order: 6, icon: "contextualmenu.and.cursorarrow"),
        ViewType.init(type: "Loyalty Program", order: 7, icon: "giftcard.fill"),
        ViewType.init(type: "Settings", order: 8, icon: "gear")
    ]
}

struct ToobarItemPlacement: View {
    @StateObject var menu = MenuItems()
    @State private var selectedMenuItem: String? = "Quick Orders"
    
    var body: some View {
        VStack(spacing: 0){
            NavigationView {
               Sidebar(
                    menu: menu,
                    selectedMenuItem: $selectedMenuItem
               )
           }
        }
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
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            }
        }
        .background(Color.black)
        .listStyle(SidebarListStyle())
    }
}

struct FullView: View {
    let type: String
    var body: some View {
        switch(type){
            case "Quick Orders": Orders()
            case "Sales": Sales()
            case "Inventory": Inventory()
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
                            Color.init(red: 133/255, green: 194/255, blue: 39/255) :
                            Color.init(red: 218/255, green: 36/255, blue: 28/255) )
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
     
            .cornerRadius(8)
    }
}



