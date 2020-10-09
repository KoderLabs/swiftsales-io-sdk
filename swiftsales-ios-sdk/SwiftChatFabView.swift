//
//  SwiftFabView.swift
//  swiftsales-ios-sdk
//
//  Created by Koderlabs on 09/10/2020.
//  Copyright © 2020 Swiftsales. All rights reserved.
//

import UIKit

public class SwiftChatFabView: UIView {

    fileprivate var plusLayer: CAShapeLayer = CAShapeLayer()
    
    fileprivate let button = UIButton(type: .custom)
    
    fileprivate let size: CGFloat = 50.0
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    private func setupView() {
        button.frame = CGRect(x: 0, y: 0, width: size, height: size)
        button.layer.cornerRadius = 0.5 * size
        button.clipsToBounds = true
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
        let image = UIImage(systemName: "bubble.right.fill")
        button.tintColor = UIColor.white
        button.setImage(image, for: .normal)
        addSubview(button)
    }
    
    @objc func chatButtonPressed() {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }

            let vc = SwiftSalesChatViewController()
            vc.modalPresentationStyle = .fullScreen
        topController.navigationController?.pushViewController(vc, animated: true) ?? topController.present(vc, animated: true, completion: nil)
        }
    }
}
