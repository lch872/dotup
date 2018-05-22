//
//  LCMainViewCell.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit
import Kingfisher
class LCMainViewCell: UITableViewCell {
    
   
    
    var mainImage: UIImageView?
    var titleLabel:UILabel?
    var typeLabel:UILabel?
    
    
    var model = RestaurantModel(){
        didSet{
            mainImage?.kf.setImage(with: URL.init(string: model.hero_listing_image!))
            titleLabel?.text = model.name!
            typeLabel?.text = "Meat • Curry • Noodles • Rice • 泰式 • 新加坡式"
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func setupView() {
        mainImage = UIImageView.init()
        self.contentView .addSubview(mainImage!)
        
        titleLabel = UILabel.init()
        typeLabel?.font = UIFont.systemFont(ofSize: 16.0)
        self.contentView .addSubview(titleLabel!)
        
        typeLabel = UILabel.init()
        typeLabel?.textColor = UIColor.lightGray
        typeLabel?.font = UIFont.systemFont(ofSize: 13.0)
        self.contentView .addSubview(typeLabel!)
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        mainImage?.frame = CGRect.init(x: self.contentView.frame.width*0.1*0.5, y: 0, width: self.contentView.frame.width*0.9, height: self.contentView.frame.width*0.9*0.5625)
        titleLabel?.frame = CGRect.init(x: mainImage!.frame.minX, y: mainImage!.frame.maxY + 5, width: mainImage!.frame.width, height: 20)
        typeLabel?.frame = CGRect.init(x: mainImage!.frame.minX, y: titleLabel!.frame.maxY + 5, width: mainImage!.frame.width, height: 20)
    }

}
