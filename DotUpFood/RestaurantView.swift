//
//  RestaurantView.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit

class RestaurantView: UIViewController,SwipeTableViewDataSource,SwipeTableViewDelegate {

    
    var swipeTableView:SwipeTableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipe = SwipeTableView.init(frame: self.view.bounds)
//        swipe.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        swipe.delegate = self;
        swipe.dataSource = self;
        swipe.shouldAdjustContentSize = NSNumber.init(value: true) as! Bool;
        
        let header = UIImageView.init(image: UIImage.init(named: "unnamed.jpg"))
        header.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.5625)
        
        swipe.swipeHeaderView = header
        
        swipe.swipeHeaderBar = UIView.init()
        swipe.swipeHeaderBarScrollDisabled = true
        self.view.addSubview(swipe)
    }
    
    func numberOfItems(in swipeView: SwipeTableView!) -> Int {
        return 4
    }
    
    func swipeTableView(_ swipeView: SwipeTableView!, viewForItemAt index: Int, reusing view: UIScrollView!) -> UIScrollView! {
        
        var table = view as? FoodChooseView
        // 重用
        if (table == nil) {
            table = FoodChooseView.init(frame: swipeView.bounds, style: .plain)
            table!.backgroundColor = UIColor.white
        }
        
        
//        view = table;
        
        return table
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
