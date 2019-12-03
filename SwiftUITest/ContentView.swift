//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Vladislav Dyakov on 12.11.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var selection = 0
    @State private var navSelection: Int? = nil
    
    var body: some View {
        TabView(selection: $selection) {
            StartView(selection: $selection, navSelection: $navSelection)
            .tabItem {
                    VStack {
                        Image(systemName: "bolt")
                        Text("Start")
                    }
            }
                .tag(0)
            FoodListView(selection: $navSelection)
                .tabItem {
                    VStack {
                        Image(systemName: "suit.heart")
                        Text("Food")
                    }
            }
                .tag(1)
            AboutView()
                .tabItem {
                        VStack {
                            Image(systemName: "star")
                            Text("About")
                        }
                }
                .tag(2)
        }
        
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
      }
   }
}
#endif
