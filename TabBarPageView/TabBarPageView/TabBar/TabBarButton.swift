//
//  TabBarButton.swift
//  SildingTabBar
//
//  Created by waltoncob on 2017/1/12.
//
//

import UIKit

public class TabBarButton:UIButton {

    private let scale:CGFloat = 0.55

    override public var isHighlighted:Bool {
        didSet{
            super.isHighlighted = false
        }
    }

    public init(){
        super.init(frame:CGRect.zero)
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.textAlignment = .center
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX:CGFloat = 0.0
        let newY:CGFloat = 5.0
        let newWidth:CGFloat = CGFloat(contentRect.size.width)
        let newHeight:CGFloat = CGFloat(contentRect.size.height)*scale-newY
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }

    override public func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*scale
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*scale
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }


    public static func makeButtonArray(titles:[String], imageStrs:[String], selImageStrs:[String], titleFontSize:CGFloat = 12.0) -> [UIButton] {
        var images:[UIImage] = []
        var selImages:[UIImage] = []
        for i in 0..<imageStrs.count {
            images.append(UIImage.init(named: imageStrs[i])!)
        }
        for i in 0..<selImageStrs.count {
            selImages.append(UIImage.init(named: selImageStrs[i])!)
        }
        return TabBarButton.makeButtonArray(titles:titles, images:images, selImages:selImages, titleFontSize:titleFontSize)
    }

    public static func makeButtonArray(titles:[String], images:[UIImage], selImages:[UIImage], titleFontSize:CGFloat = 12.0) -> [UIButton] {
        if ContainsEqual(titles,images,selImages) == false {
            print("[Warming] count of parameter_array are unequal")
        }
        var buttons:[UIButton] = []

        let ColorTitleSel = ColorRGB(41,g: 167,b: 245)
        let titleFontSize : CGFloat = 12.0
        let ColorTitle = UIColor.gray

        for i in 0..<titles.count {
            let button = TabBarButton()
            button.setTitleColor(ColorTitle, for: UIControlState())
            button.setTitleColor(ColorTitleSel, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
            button.setImage(images[i], for: .normal)
            button.setImage(selImages[i], for: .selected)
            button.setTitle(titles[i], for: UIControlState())

            buttons.append(button)
        }
        return buttons
    }

}
