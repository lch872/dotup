//
//  LCMainTableView.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit
import Kingfisher
import HandyJSON

class LCMainTableView: UITableViewController,SwipeTableViewDelegate,SwipeTableViewDataSource {
    func numberOfItems(in swipeView: SwipeTableView!) -> Int {
        return 3
    }
    
    func swipeTableView(_ swipeView: SwipeTableView!, viewForItemAt index: Int, reusing view: UIScrollView!) -> UIScrollView! {
        let tableView = view
        if (nil == tableView) {
           let tableView = UITableView.init(frame: self.view.bounds)
            tableView.backgroundColor = UIColor.white
        }
        // 这里刷新每个item的数据
//        tableView.refr
        return tableView;
    }
    
    
    var modelArray:Array<AnyObject>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(LCMainViewCell.self, forCellReuseIdentifier: "mainCell")
        
        let jsonPath = Bundle.main.path(forResource: "vendors", ofType: "json")
        let data = NSData.init(contentsOfFile: jsonPath!)
        let jsonDic = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
        let dict:NSDictionary = jsonDic.value(forKey: "data") as! NSDictionary
        let arr:Array<AnyObject> = dict.value(forKey: "items") as! Array
        
        modelArray = JSONDeserializer<RestaurantModel>.deserializeModelArrayFrom(array: arr) as! Array<AnyObject>

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! LCMainViewCell
        cell.selectionStyle = .none
        cell.model = self.modelArray![indexPath.row] as! RestaurantModel;
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let vc = RestaurantView.init()
//        vc.view = swipe
        let nav = UINavigationController.init(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
        
    }

}
