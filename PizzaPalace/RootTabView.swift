//
//  RootTabView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI

struct RootTabView: View {
    @State var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            ContentView()
                    .tabItem {
                        Text("Location")
                    }.tag(0)
            ContentView2()
                    .tabItem {
                        Text("Score")
                    }.tag(1)
            ContentView3()
                    .tabItem {
                        Text("Profile")
                    }.tag(2)
        }
        .accentColor(Color.red)
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

extension RootTabView {
    func setupTabBar() {

    }
}
