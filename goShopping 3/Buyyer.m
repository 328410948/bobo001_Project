//
//  Buyyer.m
//  goShopping
//
//  Created by bobo on 15-12-7.
//  Copyright (c) 2015年 class2. All rights reserved.
//

#import "Buyyer.h"
#import "Product.h"
#define _PATH @"/Users/qianfeng/Desktop/goShopping 3/productData"
#define _PATH_ @"/Users/qianfeng/Desktop/goShopping 3/bought"
#define PATH @"/Users/qianfeng/Desktop/goShopping 3/UsersRegistData.txt"
@implementation Buyyer
-(id)init
{
    if(self=[super init])
    {
        _allSellerName=[[NSMutableArray alloc]init];
    }
    return self;
}

//获取所有商家的姓名
-(void)getSellerName
{
    //读取用户注册文件，筛选出所有商家，然后将商家的名字提取出来
    NSString* readStr=[NSString stringWithContentsOfFile:PATH encoding:NSUTF8StringEncoding error:nil];
    NSArray* arr=[readStr componentsSeparatedByString:@"\n"];
    
    for(int i=0;i<arr.count-1;i++)
    {
        NSArray* _arr=[arr[i] componentsSeparatedByString:@" "];
        if([_arr[6]isEqualToString:@"1"])
        {
            [_allSellerName addObject:_arr[0]];
        }

    }
}

//显示所有商家的名称
-(void)showAllSellerAndProductes
{
    //获取所有商户的名称
    [self getSellerName];
    for (NSString* s in _allSellerName) {
        NSLog(@"SellerName:%@",s);
    }
    char name[50];
    NSLog(@"请输入你想要查看详情的商家名称:");
    scanf("%s",name);
    
    //查看某个商家下的商品详情
    [self showDetailBySellerName:[NSString stringWithUTF8String:name]];
    
}
//查看某个商家下的商品详情
-(void)showDetailBySellerName:(NSString*)name
{
    //解商家的商品的归档文件
    NSData* data=[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@%@",_PATH,name]];
    NSKeyedUnarchiver* a=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSArray* all=[a decodeObjectForKey:@"_allProduct"];
    for (Product* p in all) {
        
        NSLog(@"商品详情如下：\nsellerName:%@,name:%@,price:%@,description:%@,count:%@",name,p.productName,p.productPrice,p.productDescription,p.productCount);
    }
    
}
//下单
-(void)bought
{
    char sellerName[50];
    char productName[50];
    NSLog(@"请输入您要下单的商家名称:");
    scanf("%s",sellerName);
    NSLog(@"请输入您要下单的商品名称:");
    scanf("%s",productName);
    
    //解商家的商品的归档文件
    NSData* data=[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@%s",_PATH,sellerName]];
    NSKeyedUnarchiver* a=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSArray* all=[a decodeObjectForKey:@"_allProduct"];
    
    NSFileHandle* fh=[NSFileHandle fileHandleForWritingAtPath:[NSString stringWithFormat:@"%@%@",_PATH_,_name]];

    
    for (Product* p in all) {
     if([p.productName isEqualToString:[NSString stringWithUTF8String:productName]])
     {
         [fh seekToEndOfFile];
         [fh writeData:[[NSString stringWithFormat:@"sellerName:%@ productName:%@ productPrice:%@  productDescription:%@  productCount:%@\n",[NSString stringWithUTF8String:sellerName],p.productName,p.productPrice,p.productDescription,p.productCount] dataUsingEncoding:NSUTF8StringEncoding]];
     }
    
    }
    
    
}

// 查看订单
-(void)showProductList
{
    NSFileHandle* fh=[NSFileHandle fileHandleForReadingAtPath:[NSString stringWithFormat:@"%@%@",_PATH_,_name]];

    NSString* str=[[NSString alloc]initWithData:[fh readDataToEndOfFile] encoding:NSUTF8StringEncoding];
    
    NSArray* arr=[str componentsSeparatedByString:@"\n"];
    for(int i=0;i<arr.count-1;i++)
    {
        NSLog(@"订单详情如下：\n%@",arr[i]);
    }
}
@end
