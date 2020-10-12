//
//  ContentView.swift
//  swiftsales-ios-sdk-swiftui-example
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import SwiftUI
import swiftsales_ios_sdk

struct ContentView: View {
    @State private var showingChat = false
    
    var body: some View {
        VStack {
            SwiftUiSwiftChatFab()
            Button("Open Swift Chat") {
               self.showingChat = true
            }
            .sheet(isPresented: $showingChat) {
                SwiftUiSwiftChatViewController()
            }
        }
    }
}
