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
    @Binding var displayViewId: Int

    @StateObject var menu = MenuItems()
    @State private var selectedMenuItem: String? = "Quick Menu"
    let array = ["My Account", "Log out"]

    var body: some View {
        VStack {
            NavigationView {
                Sidebar(
                        displayViewId: $displayViewId,
                        menu: menu,
                        selectedMenuItem: $selectedMenuItem
                ).frame(minWidth: 100)
                        .background(SwiftUI.Color.black.edgesIgnoringSafeArea(.all))
            }
        }
                .toolbar {
                    ToolbarItemGroup {
                        Menu {
                            ForEach(array, id: \.self) { item in
                                Button(action: {}) {
                                    Text(item)
                                }
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "person.circle.fill").foregroundColor(Color.black)
                                Text("My Profile").font(.headline)
                                        .foregroundColor(Color.black)
                            }
                        }
                                .background(Color.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.1))
                                .cornerRadius(15)
                    }
                }
                .background(SwiftUI.Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ViewType: Identifiable, Hashable {
    let id = UUID()
    let type: String
    let order: Int
    let icon: String
}

struct Sidebar: View {
    @Binding var displayViewId: Int
    @ObservedObject var menu: MenuItems
    @Binding var selectedMenuItem: String?

    var body: some View {
        VStack {
            Image("pizza")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
            List {
                ForEach(menu.allMenuItems, id: \.self) { folder in
                    NavigationLink(
                            destination: FullView(displayViewId: $displayViewId, type: folder.type)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .navigationTitle(selectedMenuItem ?? ""),
                            tag: folder.type,
                            selection: $selectedMenuItem
                    ) {
                        HStack {
                            Image(systemName: folder.icon)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 18))
                            Text(folder.type)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 18))
                        }
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Text("Estimated wait time:")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14))
                    Spacer()
                }
                HStack {
                    Text("23 min")
                            .foregroundColor(Color.green)
                            .font(.system(size: 22)).padding(.leading, 35)
                    Spacer()
                }
            }.padding()

            HStack {
                Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18))
                Text("Help")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18))
                Spacer()

            }.padding()
        }
                .background(Color.black)
    }
}

struct FullView: View {
    @Binding var displayViewId: Int
    let type: String
    var body: some View {
        switch (type) {
        case "Quick Menu": QuickMenu(displayViewId: $displayViewId)
        case "Orders": Orders()
        case "Inventory": Inventory()
        case "Reservations": Inventory()
        case "Customers": Customers()
        case "Suppliers": Suppliers()
        case "Reports": Reports()
        case "Loyalty Program": CLDP()
        case "settings": Setup()
        default: Reports()
        }
    }
}

struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
                .padding(12)

                // Indigo background color on release, yellow on press.
                .background(!configuration.isPressed ?
                        Color.init(red: 218 / 255, green: 36 / 255, blue: 28 / 255) :
                        Color.init(red: 133 / 255, green: 194 / 255, blue: 39 / 255))

                // White text color on release, black on press.
                .foregroundColor(!configuration.isPressed ? .white : .black)
                .cornerRadius(8)
    }
}

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                Spacer()
            }
        }
                .padding(.horizontal, 16)
                .padding(.vertical, 5)
    }
}
