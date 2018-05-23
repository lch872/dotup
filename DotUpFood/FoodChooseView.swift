//
//  FoodChooseView.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit

class FoodChooseView: UITableView,UITableViewDelegate,UITableViewDataSource {

    var foodItemsArray:Array<ProductModel>?

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: "chooseCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseCell")
        cell?.textLabel?.text = "2.3 Cheese Egg Parata"//foodItemsArray![indexPath.row].name
        cell?.detailTextLabel?.text = "Flatbread made from whole wheat flour"
        
        return cell!
    }
    

}
