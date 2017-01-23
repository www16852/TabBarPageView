//
//  ScrollPageViewDelegate.swift
//  SliderView
//
//  Created by waltoncob on 2017/1/20.
//
//

import UIKit

public protocol TabBarPageViewDelegate:class{

    func scrollViewWillBeginDragging(index:Int)

    func scrollViewDidEndDecelerating(index:Int)

}
