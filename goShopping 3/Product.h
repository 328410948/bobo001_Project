//
//  Product.h
//  goShopping
//
//  Created by bobo on 15-12-7.
//  Copyright (c) 2015年 class2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject<NSCoding>
@property NSString* productName;
@property NSString* productPrice;
@property NSString* productDescription;
@property NSString* productCount;
@end
