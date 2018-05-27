//
//  RuntimePerson2.m
//  testdown
//
//  Created by rjb on 2018/5/19.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimePerson2.h"

@implementation RuntimePerson2


/*
 OC的方法调用，会传递默认两个隐式参数
 objc_msgSend(self,_cmd)
 id self  方法调用者
 SEL _cmd 方法编号
 */

//+ (BOOL)resolveInstanceMethod:(SEL)sel{
////    class_addMethod(self, sel, (IMP)hh, "v@:@");
//    return [super resolveInstanceMethod:sel];
//}

//void hh(id obj,SEL sel,NSString *objc){
//    NSLog(@"我来了%@,%@,%@",obj,sel,objc);
//}

//- (void)forwardInvocation {

//}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
  NSLog(@"我来了");
}
@end
