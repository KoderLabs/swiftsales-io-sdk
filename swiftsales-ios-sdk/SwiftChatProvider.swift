//
//  SwiftChatProvider.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import WebKit

class SwiftChatProvider {
    
    private static var webView: WKWebView? = nil
    private static let config = WKWebViewConfiguration()
    
    private init() {
        
    }
    
    static func getWebView(frame: CGRect, contentController: WKUserContentController) -> WKWebView {
        config.userContentController = contentController
        
        if(webView == nil) {
            webView = WKWebView(frame: frame, configuration: config)
            
            webView?.load(NSURLRequest(url: NSURL(string: "https://dev-api.swiftchat.io/widget/script?WebsiteId=\(SwiftSaleSdk.userId!)&Domain=\(SwiftSaleSdk.domainName!)&Integrate=true")! as URL) as URLRequest)
        }
        
        return webView!
    }
    
}
