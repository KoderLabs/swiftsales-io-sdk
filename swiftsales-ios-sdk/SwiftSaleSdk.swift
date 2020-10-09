//
//  SwiftSaleSdk.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit

public class SwiftSaleSdk {
    
    static var userId: Int? = nil
    static var domainName: String? = nil
    
    private init() {}
    
    public static func initialize(userId: Int, domainName: String) {
        SwiftSaleSdk.userId = userId
        SwiftSaleSdk.domainName = domainName
    }
    
    public static func pushViewController(navigationController: UINavigationController) {
        let vc = SwiftSalesChatViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(vc, animated: true)
    }
    
    public static func presentViewController(viewController: UIViewController) {
        let vc = SwiftSalesChatViewController()
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}
