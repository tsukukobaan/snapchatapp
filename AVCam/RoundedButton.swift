//
//  RoundedButton.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
}
