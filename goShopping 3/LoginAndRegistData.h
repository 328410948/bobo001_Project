//
//  LoginAndRegistData.h
//  goShopping
//
//  Created by bobo on 15-12-7.
//  Copyright (c) 2015年 class2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginAndRegistData : NSObject

@property NSString* userName;
@property NSString* passWord;
@property NSString* repeatPwd;
@property NSString* address;
@property NSString* telPhone;
@property NSString* userFlat;   //权限标记
@property NSString* postCode;

-(id)init;

@end
