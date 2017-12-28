//
//  AssignToObject.h
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssignToObject : NSObject

//这个方法可以直接把从json中得到的数组中的字典转化为具体的对象，其里面都是封装好的具体对象。
+ (NSMutableArray *)customModel:(NSString *)modelClass ToArray:(id)array;

+ (id)propertyKeysWithString:(NSString *)classStr;
//+ (id)reflectDataFromOtherObject:(id)dataSource andObjectStr:(NSString *)classStr;

@end
