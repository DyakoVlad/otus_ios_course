//
//  AboutView.swift
//  SwiftUITest
//
//  Created by Vladislav Dyakov on 03.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @State private var showAuthors: Bool = false
        
    var body: some View  {
        Button(action: {
            self.showAuthors = true
        }) {
            Text("Show Authors")
        }.betterSheet(isPresented: self.$showAuthors, onDismiss: { print("Authors diss")}, content: {
            AbotAuthorsModal()
        })
    }
}

struct AbotAuthorsModal: View {
    @Environment(\.betterSheetPresentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Закрыть")
            })
            Text("Здесь написано что-то очень умное")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
