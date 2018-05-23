//
//  SegmentControlView.swift
//  DotUpFood
//
//  Created by lch on 2018/5/23.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

import UIKit

class SegmentControlView: UIScrollView {

    var items:Array<String>?
    var selectedSegmentIndex:Int = 0
    
    var textColor:UIColor?
    var selectedTextColor:UIColor?
    var font:UIFont?
    var selectionIndicatorColor:UIColor?
    var itemWidth:CGFloat?{
        didSet{
            for (index,btn) in self.subviews.enumerated() {
                btn.frame = CGRect.init(x: CGFloat(index)*itemWidth!, y: 0, width: itemWidth!, height: self.frame.height)
            }
        }
    }

    init(frame: CGRect,items:Array<String>) {
        super.init(frame: frame)
        self.items = items
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.backgroundColor = UIColor.white
        self.showsHorizontalScrollIndicator = false
        self.contentSize = CGSize.init(width: 700, height: 40)
        font = UIFont.systemFont(ofSize: 15)
        textColor = UIColor.init(red: 50/255.0, green: 50/255.0, blue: 50/255.0, alpha: 1)
        selectedTextColor = UIColor.black
        selectionIndicatorColor = UIColor.init(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        
        selectedSegmentIndex = 0;
        
        for (index,value) in items!.enumerated() {
            
            let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 40))
            btn.isUserInteractionEnabled = false
            btn.tag = 666 + index;
            
            btn.setTitleColor(textColor, for: .normal)
            btn.setTitleColor(selectedTextColor, for: .selected)
            btn.setTitle(value, for: .normal)

            btn.titleLabel?.font = font
            
            let wid = self.frame.width/CGFloat(items!.count)
            btn.frame = CGRect.init(x: CGFloat(index)*wid, y: 0, width: wid, height: self.frame.height)
            
            self.addSubview(btn)
            if (index == selectedSegmentIndex) {
                btn.backgroundColor = selectionIndicatorColor;
                btn.isSelected = true
            }else {
                btn.backgroundColor = UIColor.clear
            }
//                    [itemBt addTarget:self action:@selector(didSelectedSegment:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.addTarget(self, action: #selector(didSelectedSegment), for: .touchUpInside)
            
            
        }
        
        
    }
    
    
    
//    func setSelectedSegmentIndex(selectedSegmentIndex:NSInteger) {
//
//    UIButton * oldItemBt      = [_contentView viewWithTag:666 + _selectedSegmentIndex];
//    oldItemBt.backgroundColor = [UIColor clearColor];
//    oldItemBt.selected        = NO;
//
//    UIButton * itemBt      = [_contentView viewWithTag:666 + selectedSegmentIndex];
//    itemBt.backgroundColor = _selectionIndicatorColor;
//    itemBt.selected        = YES;
//    _selectedSegmentIndex  = selectedSegmentIndex;
//    }
    
    @objc func didSelectedSegment(itemBt:UIButton){
        
    let oldItemBt:UIButton = self.viewWithTag(666 + selectedSegmentIndex) as! UIButton
        oldItemBt.backgroundColor = UIColor.clear
        oldItemBt.isSelected = false
    
    itemBt.backgroundColor = selectionIndicatorColor;
    itemBt.isSelected        = true;
    selectedSegmentIndex  = itemBt.tag - 666;
//    if (self.IndexChangeBlock) {
//        self.IndexChangeBlock(_selectedSegmentIndex);
//    }
    
//       self.send
    }

    
}
