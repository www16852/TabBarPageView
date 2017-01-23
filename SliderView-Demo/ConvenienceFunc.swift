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
