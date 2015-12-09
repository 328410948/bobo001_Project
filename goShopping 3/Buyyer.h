//
//  Buyyer.h
//  goShopping
//
//  Created by bobo on 15-12-7.
//  Copyright (c) 2015年 class2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Buyyer : NSObject
@property NSMutableArray* allSellerName;
@property NSString* name;
-(id)init;

//获取所有商家的姓名
-(void)showAllSellerAndProductes;

//下单
-(void)bought;

// 查看订单
-(void)showProductList;
@end
