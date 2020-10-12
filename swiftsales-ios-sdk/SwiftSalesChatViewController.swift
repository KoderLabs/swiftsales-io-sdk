//
//  SwiftSalesChatViewController.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import WebKit

public class SwiftSalesChatViewController: UIViewController {

    var webView: WKWebView?
    let contentController = WKUserContentController()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        webView = SwiftChatProvider.getWebView(frame: CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height), viewController: self)

        self.view.addSubview(webView!)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // Remove Webview
        self.view.willRemoveSubview(webView!)
        self.view.removeFromSuperview()
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
