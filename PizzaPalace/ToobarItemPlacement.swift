//
//  ToobarItemPlacement.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI

struct ToobarItemPlacement: View {
    private let tabs = ["Setup", "Data Entry", "Scheduling", "Loyalty"]
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            ChildTabView(title: self.tabs[self.selectedTab], index: self.selectedTab).background(Color.white)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("", selection: $selectedTab) {
                    ForEach(tabs.indices) { i in
                        Text(self.tabs[i])
                            .tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .frame(minWidth: 800, minHeight: 400)
        .background(Color.white)
    }
}

struct ChildTabView: View {
    var title: String
    var index: Int

    var body: some View {
        switch(index){
            case 0: Setup()
            case 1: DataEntry()
            case 2: PopularTimes()
            case 3: CLDP()
            default: Login()
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
                            Color(.systemIndigo) :
                            Color(.systemYellow))
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
     
            .cornerRadius(8)
    }
}

