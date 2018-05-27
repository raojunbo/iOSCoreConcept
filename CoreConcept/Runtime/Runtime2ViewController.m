//
//  Runtime2ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/18.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Runtime2ViewController.h"
#import <objc/runtime.h>

@interface Runtime2ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSString *property1;
@end

@implementation Runtime2ViewController{
    NSInteger ivr1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //取得本类的所有
    /*
     这是所有的变量名:ivr1
     这是所有的变量名:_property1
     */
//    unsigned int copyIvarListCount = 0;
//    Ivar * ivarList = class_copyIvarList([self class], &copyIvarListCount);
//    for (int i = 0; i < copyIvarListCount; i++) {
//        Ivar tmpIvr = ivarList[i];
//        const char * ivarName =  ivar_getName(tmpIvr);
//        NSLog(@"这是所有的变量名:%@", [NSString stringWithUTF8String:ivarName]);
//    }
//    free(ivarList);//释放copy过来的
    
    //取得所有属性名
//    unsigned int copyProplistCount = 0;
//    objc_property_t * propertylist = class_copyPropertyList([self class], &copyProplistCount);
//    for (int i = 0; i< copyProplistCount; i++) {
//        objc_property_t tmpProp = propertylist[i];
//        const char * propName = property_getName(tmpProp);
//        NSLog(@"这是所有属性的名:%@",[NSString stringWithUTF8String:propName]);
//    }
//    free(propertylist);
    
    //取得所有函数名
    //略
    
    //取得所有协议名
    /*
     UITableViewDelegate
     UITableViewDataSource
     */
    
    
//    unsigned int copyProtocolCount = 0;
//    Protocol *  __unsafe_unretained *protocolList = class_copyProtocolList([self class], &copyProtocolCount);
//    for (int i = 0; i <copyProtocolCount ; i++) {
//        Protocol  * tmpProtocol = protocolList[i];
//       const char * protocolName = protocol_getName(tmpProtocol);
//        NSLog(@"这是协议名:%@", [NSString stringWithUTF8String:protocolName]);
//    }
//    free(protocolList);
    
   Class superClass =   class_getSuperclass([self class]);
    unsigned int copyProtocolCount = 0;
    Protocol *  __unsafe_unretained *protocolList = class_copyProtocolList(superClass, &copyProtocolCount);
    for (int i = 0; i <copyProtocolCount ; i++) {
        Protocol  * tmpProtocol = protocolList[i];
        const char * protocolName = protocol_getName(tmpProtocol);
        NSLog(@"这是协议名:%@", [NSString stringWithUTF8String:protocolName]);
    }
    free(protocolList);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
