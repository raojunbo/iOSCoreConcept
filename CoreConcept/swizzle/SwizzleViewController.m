//
//  SwizzleViewController.m
//  CoreConcept
//
//  Created by rjb on 2019/3/19.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "SwizzleViewController.h"
#import <objc/runtime.h>

@interface RuntimeCat : NSObject

@end
@implementation RuntimeCat

- (void)jiao {
    NSLog(@"I am a cat");
}

+ (void)load {
    unsigned int count;
//    Method *methods = class_copyMethodList([self class], &count);
//    for (int i = 0; i < count; i++) {
//        NSLog(@"tag0=%s", sel_getName(method_getName(methods[i])));
//    }
    Method originalInit = class_getInstanceMethod([self class], @selector(jiao));
}

@end

@interface RuntimeCat1 : RuntimeCat

@end
@implementation RuntimeCat1

+ (void)load {
    NSLog(@"%s",__FUNCTION__);
    
//    unsigned int count1;
//    Method *methods1 = class_copyMethodList([self class], &count1);
//    for (int i = 0; i < count1; i++) {
//        NSLog(@"tag1=%s", sel_getName(method_getName(methods1[i])));
//    }
//
    Method originalInit = class_getInstanceMethod([self class], @selector(jiao));
    Method mjInit = class_getInstanceMethod([self class], @selector(run));
    if (originalInit && mjInit) {
        method_exchangeImplementations(originalInit, mjInit);//将两者的imp进行交换，rewrite后的东西是一个静态方法，只想的函数不一样罢了
    }
    
//    unsigned int count;
//    Method *methods = class_copyMethodList([self class], &count);
//    for (int i = 0; i < count; i++) {
//        NSLog(@"tag=%s", sel_getName(method_getName(methods[i])));
//    }
    
    Method originalInit1 = class_getInstanceMethod([self class], @selector(jiao));
    Method mjInit1 = class_getInstanceMethod([self class], @selector(run));
    
}

- (void)run {
    NSLog(@"pao");
}

@end
@interface SwizzleViewController ()

@end

@implementation SwizzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    RuntimeCat *cat = [[RuntimeCat alloc]init];
    [cat jiao];//期望，pao：
    
    RuntimeCat1 *cat1 = [[RuntimeCat1 alloc]init];
    [cat1 jiao];//期望，pao
}

@end
