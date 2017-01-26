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
        
        var pageViewContents:[(UIView,UIButton)] = []

        let button1 = TabBarButton(frame:CGRect.zero, title:"首頁", imageStr:"home_tabbar", selImageStr:"home_tabbar_sel")
        pageViewContents.append((views[0],button1))
        let button2 = TabBarButton(frame:CGRect.zero, title:"朋友", imageStr:"msg_tabbar", selImageStr:"msg_tabbar_sel")
        pageViewContents.append((views[1],button2))
        let button3 = TabBarButton(frame:CGRect.zero, title:"我的", imageStr:"friend_tabbar", selImageStr:"friend_tabbar_sel")
        pageViewContents.append((views[2],button3))
        let button4 = TabBarButton(frame:CGRect.zero, title:"消息", imageStr:"me_tabbar", selImageStr:"me_tabbar_sel")
        pageViewContents.append((views[3],button4))

        let pageView = TabBarPageView(frame:self.view.frame, contents:pageViewContents)
        pageView.delegate = self
        self.view = pageView
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

