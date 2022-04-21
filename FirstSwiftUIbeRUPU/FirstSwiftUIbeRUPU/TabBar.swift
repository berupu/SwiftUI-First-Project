//
//  TabBar.swift
//  FirstSwiftUIbeRUPU
//
//  Created by be RUPU on 17/12/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                VStack {
                    Image("IconHome")
                    Text("Home")
                }
            }
            .tag(1)
            
            ContentView().tabItem {
                VStack {
                    Image("IconCards")
                    Text("Certificates")
                }
            }
            .tag(2)
            
            Settings().tabItem {
                VStack {
                    Image("IconSettings")
                    Text("Settings")
                }
            }
            .tag(3)
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
