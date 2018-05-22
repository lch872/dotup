//
//  RestaurantModel.swift
//  DotUpFood
//
//  Created by lch on 2018/5/22.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit
import HandyJSON
class RestaurantModel: NSObject,HandyJSON {
    var address:String?
    var customer_phone:String?
    var distance:NSNumber?
    var hero_image:String?
    var hero_listing_image:String?
    var id:String?
    
    var is_active:Bool?
    var is_best_in_city:Bool?
    
    var name:String?
    var post_code:String?
    var logo:String?
    var customer_type:String?
    
    
    
    
    var primary_cuisine_id:NSNumber?
    /// 店铺评分
    var rating:NSNumber?
    var review_number:NSNumber?
    var review_with_comment_number:NSNumber?

    
    var delivery_fee_type:String?
    
    var longitude:String?
    var latitude:String?
    
    var code:String?
    
    
    
    /// 提供收据
    var is_voucher_enabled:Bool?
    
    /// 提供预定
    var is_preorder_enabled:Bool?
    
    /// 提供运送
    var is_delivery_enabled:Bool?
    
    
    /// 增值税
    var is_vat_disabled:Bool?
    var is_vat_included_in_product_price:Bool?
    var is_vat_visible:Bool?
    
    //低消
    var minimum_delivery_fee:NSNumber?
    var minimum_delivery_time:NSNumber?
    var minimum_order_amount:NSNumber?
    var minimum_pickup_time:NSNumber?
    
    /// 最大运送数量
    var maximum_express_order_amount:NSNumber?
    
    var service_fee_percentage_amount:NSNumber?
    var service_tax_percentage_amount:NSNumber?
    
    /// 增值税最大数量
    var vat_percentage_amount:NSNumber?
    
    var food_characteristics_lch:String?
    

    /// 是否促销
    var is_promoted:Bool?
    
    var is_service_fee_enabled:Bool?
    var is_service_tax_enabled:Bool?
    var is_service_tax_visible:Bool?
    var is_test:Bool?
    
    var is_new:Bool?
    var is_pickup_enabled:Bool?
    var is_premium:Bool?
    var is_checkout_comment_enabled:Bool?
    
    var add1ress:Bool?
    
    required override init(){}
}
