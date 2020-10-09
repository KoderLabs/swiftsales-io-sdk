//
//  ViewController.swift
//  swiftsales-ios-sdk-uikit-example
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit
import swiftsales_ios_sdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OpenSwiftChatPressed(_ sender: UIButton) {
        SwiftSaleSdk.presentViewController(viewController: self)
    }
}

