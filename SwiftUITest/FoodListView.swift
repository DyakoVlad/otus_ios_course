//
//  FoodListView.swift
//  SwiftUITest
//
//  Created by Vladislav Dyakov on 28.11.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI

import SwiftUI
import Combine
import BetterSheet

final class FoodListViewModel: ObservableObject {
    
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food(name: "burger", isFav: true, emodzi: "🍔", tag: 0),
                                         Food(name: "hotdog", isFav: false, emodzi: "🌭", tag: 1),
                                         Food(name: "shawarma", isFav: false, emodzi: "🌯", tag: 2),
                                         Food(name: "french fries", isFav: true, emodzi: "🍟", tag: 3)]
}

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFav: Bool
    let emodzi: String
    let tag: Int
}

struct FoodListView: View {
    
    @ObservedObject var viewModel = FoodListViewModel()
    
    @State var favesShowed: Bool = false
    @Binding var selection: Int?
    
    var body: some View {
        NavigationView {
            List {
                FilterView(favesShowed: $favesShowed).environmentObject(viewModel)
                ForEach(viewModel.foods) { food in
                    if self.favesShowed || food.isFav {
                        NavigationLink(destination: FoodView(emodzi: food.emodzi), tag: food.tag, selection: self.$selection) {
                            Text(food.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Foods")
        }
        
    }
}

struct FilterView: View {
    
    @Binding var favesShowed: Bool
    
    @EnvironmentObject var viewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}
