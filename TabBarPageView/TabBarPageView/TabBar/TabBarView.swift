//
//  TabBarView.swift
//  SildingTabBar
//
//  Created by waltoncob on 2017/1/13.
//
//

import UIKit

internal class TabBarView:UIView {

    private var buttonArray:[UIButton] = []
    private var selectedBtn:UIButton!
    private var selectedIndex:Int {
        get{
            return buttonArray.index(of: selectedBtn)!
        }
    }
    internal weak var delegate:TabBarViewDelegate!

    init(frame:CGRect, buttons:[UIButton]){
        buttonArray = buttons
        super.init(frame:frame)
        self.backgroundColor = UIColor.white
        setupTabBarButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTabBarButton(){
        let num = buttonArray.count
        for i in 0..<num {
            let button = buttonArray[i]
            button.addTarget(self, action:#selector(buttonAction(button:)), for: .touchDown)
            self.addSubview(button)
            if i == 0 {
                button.isSelected = true
                self.selectedBtn = button
            }
        }
        adjustButton()
    }

    internal func tranSelected(index:Int){
        guard index >= 0 && index < buttonArray.count else {
            print("[warming] TabBarView tranSelected: parameter over limit")
            return
        }
        self.selectedBtn.isSelected = false

        self.selectedBtn = buttonArray[index]
        self.selectedBtn.isSelected = true
    }

    internal func adjustButton(){
        let num = buttonArray.count
        let width = self.frame.size.width
        let w = width/CGFloat(num)
        let h = self.frame.size.height
        let y:CGFloat = 0.0

        for i in 0..<num {
            let x = CGFloat(width/CGFloat(num)*CGFloat(i))
            let button = buttonArray[i]
            button.frame = CGRect(x: x,y: y,width: w,height: h)
        }
    }

    @objc private func buttonAction(button:UIButton){
        self.selectedBtn.isSelected = false
        button.isSelected = true
        self.selectedBtn = button
        delegate.tabBarView(didSelectIndex: selectedIndex)
    }

}
