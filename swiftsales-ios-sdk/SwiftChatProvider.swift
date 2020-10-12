//
//  SwiftChatProvider.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import WebKit

class SwiftChatProvider : NSObject, WKScriptMessageHandler {
    
    private var webView: WKWebView? = nil
    
    private static var viewController: UIViewController? = nil
    private static var INSTANCE: SwiftChatProvider? = nil
    
    private override init() {
        
    }
    
    private init(frame: CGRect) {
        super.init()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "callbackHandler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
            
        webView = WKWebView(frame: frame, configuration: config)
            
        webView?.load(NSURLRequest(url: NSURL(string: "https://dev-api.swiftchat.io/widget/script?WebsiteId=\(SwiftSaleSdk.userId!)&Domain=\(SwiftSaleSdk.domainName!)&Integrate=true")! as URL) as URLRequest)
        
    }
    
    // delegates
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "callbackHandler"){
            if(SwiftChatProvider.viewController?.navigationController == nil) {
                SwiftChatProvider.viewController?.dismiss(animated: true, completion: nil)
            } else {
                SwiftChatProvider.viewController?.navigationController?.popViewController(animated: true)
            }
            SwiftChatProvider.viewController = nil
        }
    }
    
    // static functions
    public static func getWebView(frame: CGRect, viewController: UIViewController) -> WKWebView {
        SwiftChatProvider.viewController = viewController
        
        if(SwiftChatProvider.INSTANCE == nil) {
            SwiftChatProvider.INSTANCE = SwiftChatProvider(frame: frame)
        }
        
        return SwiftChatProvider.INSTANCE!.webView!
    }
}
