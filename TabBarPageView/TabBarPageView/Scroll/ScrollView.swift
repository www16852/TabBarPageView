//
//  ScrollView.swift
//  SliderView
//
//  Created by waltoncob on 2017/1/20.
//
//

import UIKit

internal class ScrollView:UIScrollView {

    internal var selectIndex:Int{
        get{
            return Int(self.contentOffset.x / self.frame.width)
        }
    }

    internal init(frame:CGRect, subViews:[UIView]){
        super.init(frame: frame)

        self.isPagingEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bounces = false

        let contentWidth = self.frame.width * CGFloat(subViews.count)
        let contentHeight = self.frame.height
        self.contentSize = CGSize(width:contentWidth, height:contentHeight)
        setupSubViews(subViews)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func showView(index:Int){
        let x:CGFloat = CGFloat(index) * self.frame.width
        let y:CGFloat = 0.0
        let point = CGPoint(x:x, y:y)
        self.setContentOffset(point, animated:true)
    }

//MARK:setup

    private func setupSubViews(_ views:[UIView]){
        let width = self.frame.width
        for (i,view) in views.enumerated() {
            let CGindex = CGFloat(i)
            view.frame.origin.x += CGindex * width
            self.addSubview(view)
        }
    }

}
