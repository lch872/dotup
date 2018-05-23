//
//  CustomSegmentControl.m
//  SwipeTableView
//
//  Created by Roy lee on 16/5/28.
//  Copyright © 2016年 Roy lee. All rights reserved.
//

#import "CustomSegmentControl.h"
#import "UIView+STFrame.h"
#define RGBColor(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface CustomSegmentControl ()

@property (nonatomic, strong) UIScrollView * contentView;
@property (nonatomic, strong) NSArray * items;

@end

@implementation CustomSegmentControl

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    
    
}


//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//
//    }
//    return self;
//}

- (instancetype)initWithItems:(NSArray *)items itemWidth:(CGFloat)width{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        if (items.count > 0) {
            self.items = items;
            self.itemWidth = width;
            [self commonInit];
        }
    }
    return self;
}

- (void)commonInit {
    _contentView = [UIScrollView new];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.contentSize = CGSizeMake(_items.count*_itemWidth, 40);
    _contentView.userInteractionEnabled = true;
    _contentView.showsHorizontalScrollIndicator = false;
    [self addSubview:_contentView];
    _font = [UIFont systemFontOfSize:13];
    _textColor = RGBColor(50, 50, 50);
    _selectedTextColor = RGBColor(0, 0, 0);
    _selectionIndicatorColor = RGBColor(150, 150, 150);
    
//    _items = @[@"Segment0",@"Segment1"];
    _selectedSegmentIndex = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *subView in _contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    _contentView.backgroundColor = _backgroundColor;
    _contentView.frame = self.bounds;
    for (int i = 0; i < _items.count; i ++) {

        UIButton * itemBt = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBt.tag = 666 + i;
        [itemBt setTitleColor:_textColor forState:UIControlStateNormal];
        [itemBt setTitleColor:_selectedTextColor forState:UIControlStateSelected];
        [itemBt setTitle:_items[i] forState:UIControlStateNormal];
        [itemBt.titleLabel setFont:_font];
        CGFloat itemWidth = _itemWidth == 0?self.st_width/_items.count:_itemWidth;
        itemBt.st_size = CGSizeMake(itemWidth, self.st_height);
        itemBt.st_x    = itemWidth * i;
        if (i == _selectedSegmentIndex) {
            itemBt.backgroundColor = _selectionIndicatorColor;
            itemBt.selected = YES;
        }else {
            itemBt.backgroundColor = [UIColor clearColor];
        }
        [itemBt addTarget:self action:@selector(didSelectedSegment:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:itemBt];
    }
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    UIButton * oldItemBt      = [_contentView viewWithTag:666 + _selectedSegmentIndex];
    oldItemBt.backgroundColor = [UIColor clearColor];
    oldItemBt.selected        = NO;
    
    UIButton * itemBt      = [_contentView viewWithTag:666 + selectedSegmentIndex];
    itemBt.backgroundColor = _selectionIndicatorColor;
    itemBt.selected        = YES;
    _selectedSegmentIndex  = selectedSegmentIndex;
}

- (void)didSelectedSegment:(UIButton *)itemBt {
    UIButton * oldItemBt      = [_contentView viewWithTag:666 + _selectedSegmentIndex];
    oldItemBt.backgroundColor = [UIColor clearColor];
    oldItemBt.selected        = NO;
    
    itemBt.backgroundColor = _selectionIndicatorColor;
    itemBt.selected        = YES;
    _selectedSegmentIndex  = itemBt.tag - 666;
    if (self.IndexChangeBlock) {
        self.IndexChangeBlock(_selectedSegmentIndex);
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    [self adjustScrollOffset];
}

- (void)adjustScrollOffset{
    
    NSLog( @"  %f  ", _contentView.contentOffset.x);
//    return;
    CGPoint offset = _contentView.contentOffset;
    
    UIButton *currentButton = [self viewWithTag:666+_selectedSegmentIndex];
    NSLog( @"  %@  ", currentButton.titleLabel.text);

    // 控制按钮居中
    offset.x = currentButton.center.x - [UIScreen mainScreen].bounds.size.width * 0.5;
    //越界处理
    if (offset.x < 0) { offset.x = 0; }
    
    CGFloat maxValue = _contentView.contentSize.width - [UIScreen mainScreen].bounds.size.width;
    if (offset.x > maxValue){
        offset.x = maxValue;
    }
    NSLog( @"offset  %@  ", NSStringFromCGPoint(offset));

    [_contentView setContentOffset:offset animated:true];
}
@end





