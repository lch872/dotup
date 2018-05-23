//
//  RestaurantView.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit
import HandyJSON

class RestaurantView: UIViewController,SwipeTableViewDataSource,SwipeTableViewDelegate {
    
    
    var swipeTableView:SwipeTableView?
    var segmentBar:CustomSegmentControl?
    
    var productsArray: Array<MenuCategoriesModel>?
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        let jsonPath = Bundle.main.path(forResource: "7045", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
        let dict:NSDictionary = jsonDic.value(forKey: "data") as! NSDictionary
        let arr1:Array<AnyObject> = dict.value(forKey: "menus") as! Array<AnyObject>
        let dict3:NSDictionary = arr1[0] as! NSDictionary
        let arr:Array<AnyObject> = (dict3.value(forKey: "menu_categories") as! NSArray) as Array<AnyObject>
        
        productsArray = JSONDeserializer<MenuCategoriesModel>.deserializeModelArrayFrom(array: arr)! as! Array<MenuCategoriesModel>
        
        
        
        swipeTableView = SwipeTableView.init(frame: CGRect.init(x: 0, y: -64, width: self.view.bounds.width, height: self.view.bounds.height))
        //        swipe.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        swipeTableView?.delegate = self;
        swipeTableView?.dataSource = self;
        swipeTableView?.shouldAdjustContentSize = Bool.init(false)
        
        let header = UIImageView.init(image: UIImage.init(named: "unnamed.jpg"))
        header.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.5625)
        swipeTableView?.swipeHeaderView = header
        
        
        var titleArr = Array<String>()
        for Menu:MenuCategoriesModel in productsArray! {
            titleArr.append(Menu.name!)
        }
        
        
        segmentBar = CustomSegmentControl.init(items: titleArr, itemWidth: 100)
        segmentBar?.frame = CGRect.init(x: 0, y: 0, width:Int(UIScreen.main.bounds.width) ,height: Int(40.0))
        segmentBar?.font = UIFont.systemFont(ofSize: 15)
        segmentBar?.textColor =  UIColor.init(white: 100/255.0, alpha: 1)
        segmentBar?.selectedTextColor = UIColor.init(white: 0, alpha: 1)
        segmentBar?.backgroundColor = UIColor.init(red: 249/255.0, green: 251/255.0, blue: 198/255.0, alpha: 1)
        segmentBar?.selectionIndicatorColor = UIColor.init(red: 249/255.0, green: 104/255.0, blue: 92/255.0, alpha: 1)
        segmentBar?.selectedSegmentIndex = (swipeTableView?.currentItemIndex)!
        segmentBar?.addTarget(self, action: #selector(changeSwipeViewIndex), for: .valueChanged)
        
//        let segmentBar = SegmentControlView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40), items: titleArr)
//        segmentBar.itemWidth = 120
       
            
        swipeTableView?.swipeHeaderBar = segmentBar
        swipeTableView?.swipeHeaderBarScrollDisabled = Bool.init(false);
        self.view.addSubview(swipeTableView!)
    }
    
    
    @objc func changeSwipeViewIndex(seg:UISegmentedControl) {
        self.swipeTableView?.scrollToItem(at: seg.selectedSegmentIndex, animated: false)
    }
    func numberOfItems(in swipeView: SwipeTableView!) -> Int {
        return 10
    }
    
    func swipeTableView(_ swipeView: SwipeTableView!, viewForItemAt index: Int, reusing view: UIScrollView!) -> UIScrollView! {
        
        var table = view as? FoodChooseView
        // 重用
        if (table == nil) {
            table = FoodChooseView.init(frame: swipeView.bounds, style: .plain)
            table!.foodItemsArray = self.productsArray?.first?.productsArray;
            table!.backgroundColor = UIColor.white
        }
        
        
        //        view = table;
        
        return table
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func swipeTableViewCurrentItemIndexDidChange(_ swipeView: SwipeTableView!) {
        self.segmentBar?.selectedSegmentIndex = swipeView.currentItemIndex;
        self.segmentBar?.adjustScrollOffset()
     
    }
    
}
