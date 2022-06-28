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
    
    private static var JAVSCRIPT_WEBKIT_CALLBACK = "callbackHandler"
    
    private override init() {
        
    }
    
    private init(frame: CGRect) {
        super.init()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: SwiftChatProvider.JAVSCRIPT_WEBKIT_CALLBACK)
        
        ///  `WKWebView Configuration`
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.websiteDataStore = .nonPersistent()
 
        // Set Process Pool
        let processPool: WKProcessPool
        if let pool: WKProcessPool = self.getData(key: "pool") {
            processPool = pool
        } else {
            processPool = WKProcessPool()
            self.setData(processPool, key: "pool")
        }
        config.processPool = processPool
        
        // Set Cookie
        if let cookies: [HTTPCookie] = self.getData(key: "cookies") {
            for cookies in cookies {
                if #available(iOS 11.0, *) {
                    config.websiteDataStore.httpCookieStore.setCookie(cookies)
                }
            }
        }
        
        ///  `Load WKWebView`
        webView = WKWebView(frame: frame, configuration: config)
        webView?.load(NSURLRequest(url: NSURL(string: "https://api.swiftchat.io/chat/widget/script?WebsiteId=\(SwiftSaleSdk.userId!)&Domain=\(SwiftSaleSdk.domainName!)&Integrate=true")! as URL) as URLRequest)
    }
    
    // delegates
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == SwiftChatProvider.JAVSCRIPT_WEBKIT_CALLBACK){
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


//MARK: Extension (To save Cookie and Process Pool)
extension SwiftChatProvider {
    func setData(_ value: Any, key: String) {
        let ud = UserDefaults.standard
        let archivedPool = NSKeyedArchiver.archivedData(withRootObject: value)
        ud.set(archivedPool, forKey: key)
    }

    func getData<T>(key: String) -> T? {
        let ud = UserDefaults.standard
        if let val = ud.value(forKey: key) as? Data,
            let obj = NSKeyedUnarchiver.unarchiveObject(with: val) as? T {
            return obj
        }

        return nil
    }
}
