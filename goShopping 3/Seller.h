//
//  Seller.h
//  goShopping
//
//  Created by bobo on 15-12-7.
//  Copyright (c) 2015年 class2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Seller : NSObject

//保存商品对象的对象的引用
@property NSMutableArray* allProduct;
@property NSString* sellerName;

-(id)init;

//上架商品，且将商品信息保存到磁盘文件中
-(void)addProduct;
-(void)removeProduct;
-(void)showAllProduct;


@end
