//
//  SwiftUiSwiftChatFab.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import SwiftUI


public struct SwiftUiSwiftChatFab: UIViewRepresentable {

    public init() {
    }
    
    public func makeUIView(context: Context) -> SwiftChatFabView {
        return SwiftChatFabView()
    }

    public func updateUIView(_ uiView: SwiftChatFabView, context: Context) {
        
    }
}

struct SwiftUiSwiftChatFab_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUiSwiftChatFab()
    }
}
