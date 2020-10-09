//
//  SwiftSalesChatViewController.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import WebKit

public class SwiftSalesChatViewController: UIViewController, WKScriptMessageHandler {

    var webView: WKWebView?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        let contentController = WKUserContentController()
        contentController.add(self, name: "callbackHandler")
        
        webView = SwiftChatProvider.getWebView(frame: CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height), contentController: contentController)
        self.view.addSubview(webView!)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "callbackHandler"){
            if(navigationController == nil) {
                dismiss(animated: true, completion: nil)
            } else {
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
