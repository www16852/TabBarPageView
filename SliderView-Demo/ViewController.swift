//
//  ViewController.swift
//  SliderView
//
//  Created by waltoncob on 2017/1/19.
//
//

import UIKit
import TabBarPageView

class ViewController: UIViewController,TabBarPageViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        var views:[UIView] = []
        for _ in 0...4 {
            let view = UIView(frame: self.view.frame)
            view.backgroundColor = ColorRandom()
            views.append(view)
        }

        let titleArray = ["首頁","朋友","我的","消息","消息"]
        let imageArray = ["home_tabbar","msg_tabbar","friend_tabbar","me_tabbar","me_tabbar"]
        let selImageArray = ["home_tabbar_sel","msg_tabbar_sel","friend_tabbar_sel","me_tabbar_sel","me_tabbar_sel"]
        var buttons:[UIButton] = []

        for i in 0..<titleArray.count {
            buttons.append(TabBarButton(frame: CGRect.zero, title: titleArray[i], imageStr: imageArray[i], selImageStr: selImageArray[i]))
        }

        let scrollPage = TabBarPageView(frame:self.view.frame, subViews:views, buttons:buttons)
        scrollPage.delegate = self
        self.view = scrollPage
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewWillBeginDragging(index:Int){
        print("Dragging begin = \(index)")
    }

    func scrollViewDidEndDecelerating(index:Int){
        print("Dragging end = \(index)")
    }

}

