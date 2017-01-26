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
    private let ColorTitleSel = ColorRGB(41,g: 167,b: 245)
    private let ColorTitle = UIColor.gray

    override public var isHighlighted:Bool {
        didSet{
            super.isHighlighted = false
        }
    }

    public convenience init(frame:CGRect, title:String, imageStr:String, selImageStr:String, titleFontSize:CGFloat = 12.0){
        let image:UIImage = UIImage.init(named: imageStr)!
        let selImage:UIImage = UIImage.init(named: selImageStr)!
        self.init(frame:frame, title:title, image:image, selImage:selImage, titleFontSize:titleFontSize)
    }

    public convenience init(frame:CGRect, title:String, image:UIImage, selImage:UIImage, titleFontSize:CGFloat = 12.0){
        self.init(frame:frame)
        self.setTitleColor(ColorTitle, for: UIControlState())
        self.setTitleColor(ColorTitleSel, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
        self.setImage(image, for: .normal)
        self.setImage(selImage, for: .selected)
        self.setTitle(title, for: UIControlState())
    }

    public override init(frame:CGRect){
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
    
}
