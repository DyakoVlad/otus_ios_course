//
//  SwiftUIView.swift
//  SwiftUITest
//
//  Created by Vladislav Dyakov on 03.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @Binding var selection: Int
    @Binding var navSelection: Int?
    
    var body: some View {
        Button(action: {
            self.selection = 1
            self.navSelection = 0
        }) {
            Text("Get the burger!")
        }
    }
}
