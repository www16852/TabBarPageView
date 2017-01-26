//
//  ScrollPageView.swift
//  SliderView
//
//  Created by waltoncob on 2017/1/19.
//
//

import UIKit

public class TabBarPageView:UIView,UIScrollViewDelegate,TabBarViewDelegate {

    private var scrollView:ScrollView!
    private var tabBarView:TabBarView!
    public weak var delegate:TabBarPageViewDelegate?

    public convenience init(frame:CGRect, contents:[(UIView,UIButton)], tabBarHeight:CGFloat = 50){
        var subViews:[UIView] = []
        var buttons:[UIButton] = []
        for (subView,button) in contents {
            subViews.append(subView)
            buttons.append(button)
        }
        self.init(frame:frame, subViews:subViews)
        setupTabBarView(buttons, height:tabBarHeight)
    }

    public init(frame:CGRect, subViews:[UIView]){
        super.init(frame: frame)
        setupScrollView(subViews)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func showView(index:Int){
        self.scrollView.showView(index:index)
    }

//MARK:setup

    private func setupTabBarView(_ buttons:[UIButton], height:CGFloat){
        let tabBarWidth = self.frame.width
        let tabBarHeight:CGFloat = height
        let y:CGFloat = self.frame.size.height - tabBarHeight
        let frame = CGRect(x:0, y:y, width:tabBarWidth, height:tabBarHeight)

        tabBarView = TabBarView(frame:frame, buttons:buttons)
        self.addSubview(tabBarView)
        tabBarView.delegate = self
    }

    private func setupScrollView(_ subViews:[UIView]){
        self.scrollView = ScrollView(frame:frame, subViews:subViews)
        self.scrollView.delegate = self
        self.addSubview(self.scrollView)
    }

//MARK:UIScrollViewDelegate

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        delegate?.scrollViewWillBeginDragging(index: self.scrollView.selectIndex)
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        tabBarView.tranSelected(index: self.scrollView.selectIndex)
        delegate?.scrollViewDidEndDecelerating(index: self.scrollView.selectIndex)
    }

//MARK:MyTabBarViewDelegate
    func tabBarView(didSelectIndex:Int){
        print("tabBarView \(didSelectIndex)")
        showView(index:didSelectIndex)
    }

}
