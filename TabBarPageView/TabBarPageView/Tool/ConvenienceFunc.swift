//
//  ExtensionFunction.swift
//  SildingTabBar
//
//  Created by waltoncob on 2017/1/9.
//  Copyright © 2017年 waltoncob. All rights reserved.
//

import UIKit

internal func ColorRGB(_ r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    return ColorRGBA(r, g: g, b: b, a: 1.0)
}

internal func ColorRGBA(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:a)

}

internal func ColorRandom() -> UIColor {
    return ColorRGB(CGFloat(arc4random()%255), g: CGFloat(arc4random()%255), b: CGFloat(arc4random()%255))
}

internal func ContainsEqual(_ contains:Container...) -> Bool {
    guard contains.count != 0 else {
        print("func_ContainEqual parameter count == 0")
        return true
    }
    let count = contains[0].count
    for contain in contains {
        if contain.count != count {
            return false
        }
    }
    return true
}

internal func Constraints_fullup(subview:UIView,superview:UIView){
    print("fullup")
    superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview , attribute: .trailing, multiplier: 1, constant: 0))
    superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview , attribute: .leading, multiplier: 1, constant: 0))
    superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview , attribute: .height, multiplier: 1, constant: 0))
    superview.addConstraint(NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview , attribute: .centerY, multiplier: 1, constant: 0))
}
