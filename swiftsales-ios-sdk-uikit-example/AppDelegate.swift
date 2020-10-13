//
//  AppDelegate.swift
//  swiftsales-ios-sdk-uikit-example
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import swiftsales_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        SwiftSaleSdk.initialize(userId: 865, domainName:  "files.shahzaibsheikh.com")
        return true
    }


}

