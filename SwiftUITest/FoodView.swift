//
//  FoodView.swift
//  SwiftUITest
//
//  Created by Vladislav Dyakov on 28.11.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    
    var emodzi: String
    
    var body: some View {
        Text(emodzi)
            .font(.system(size: 100))
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(emodzi: "🥔")
    }
}
