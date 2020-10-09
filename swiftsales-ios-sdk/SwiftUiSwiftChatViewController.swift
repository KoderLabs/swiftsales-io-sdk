//
//  SwiftUIFabView.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import SwiftUI

public struct SwiftUiSwiftChatViewController: UIViewControllerRepresentable {
    
    public init() {
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<SwiftUiSwiftChatViewController>) -> SwiftSalesChatViewController {
        return SwiftSalesChatViewController()
    }
    
    public func updateUIViewController(_ uiViewController: SwiftSalesChatViewController, context: UIViewControllerRepresentableContext<SwiftUiSwiftChatViewController>) {
        
    }
}



