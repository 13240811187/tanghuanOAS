//
//  UITableViewHeaderFooterView+isExpanded.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "UITableViewHeaderFooterView+isExpanded.h"
#import <objc/runtime.h>
@implementation UITableViewHeaderFooterView (isExpanded)

//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self methodSwizzlingWithOriginalSelector:@selector(initWithReuseIdentifier:) bySwizzledSelector:@selector(my_initWithReuseIdentifier:)];
//    });
//}

-(instancetype)my_initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self.isExpanded = YES;
    return [self my_initWithReuseIdentifier:reuseIdentifier];
}

- (BOOL)isExpanded{
    return [objc_getAssociatedObject(self, @selector(isExpanded)) boolValue];
}

- (void)setIsExpanded:(BOOL)isExpanded {
    objc_setAssociatedObject(self, @selector(isExpanded), [NSNumber numberWithBool:isExpanded], OBJC_ASSOCIATION_ASSIGN);
}

+  (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        
                                        method_getImplementation(swizzledMethod),
                                        
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,swizzledSelector,
                            
                            method_getImplementation(originalMethod),
                            
                            method_getTypeEncoding(originalMethod));
    } else {
    
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
