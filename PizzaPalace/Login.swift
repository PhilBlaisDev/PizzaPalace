//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct UserObject {
    var password = "823he92389u"
    var number = ""
    var street = ""
    var postalCode = ""
    var city = ""
    var country = ""
    var email = ""
    var firstName = ""
    var lastName = ""
    var phone = ""
    var note = ""
    var cardNumber = ""
    var expDate = ""
    var csc = ""
    var isLoyaltyMember = false
}

class DisplayedView: ObservableObject {
    @Published var displayViewId: Int = 0

}

struct Login: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var displayedView = DisplayedView()

    var body: some View {
        VStack(spacing: 20) {
            if displayedView.displayViewId == 1 {
                ToobarItemPlacement(displayViewId: $displayedView.displayViewId)
            }
            else if displayedView.displayViewId == 2 {
                SetTable(displayViewId: $displayedView.displayViewId)
            }
            else if displayedView.displayViewId == 10 {
                CreateCustomer(displayViewId: $displayedView.displayViewId)
            }
            else {
                DetailedView(displayViewId: $displayedView.displayViewId)
            }
        }
        .background(displayedView.displayViewId == 0 ? Image("pizza_bg").resizable().aspectRatio(contentMode: .fill) : Image("white_bg").resizable().aspectRatio(contentMode: .fill))
        .buttonStyle(MenuButtonStyle())
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
