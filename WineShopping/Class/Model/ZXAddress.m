//
//  ZXAddress.m
//  WineShopping
//
//  Created by xinying on 2017/4/14.
//  Copyright © 2017年 habav. All rights reserved.
//

#import "ZXAddress.h"
#import <objc/runtime.h>

@implementation ZXAddress

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    ZXLog(@"address不能识别key---%@",key);
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"name =%@ ,address = %@ phone = %@",self.w_name,self.w_address,self.w_name];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    unsigned int count =0;
    objc_property_t *propertyList =class_copyPropertyList([self class], &count);
    
    for (int i =0; i<count; i++) {
        objc_property_t pro =propertyList[i];
        const char *name =property_getName(pro);
        NSString *key =[NSString stringWithUTF8String:name];
        
        if ([aDecoder decodeObjectForKey:key]) {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count =0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}



@end
