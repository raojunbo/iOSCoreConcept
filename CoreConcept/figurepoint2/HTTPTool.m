//
//  HTTPTool.m
//  KLine-Chart-OC
//
//  Created by 何俊松 on 2020/3/11.
//  Copyright © 2020 hjs. All rights reserved.
//

#import "HTTPTool.h"
#import "YYModel.h"
@interface HTTPTool()
@property(nonatomic,strong) NSURLSessionDataTask *currentDataTask;

@end

static HTTPTool *tool = nil;
@implementation HTTPTool

+(instancetype)tool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

-(void)getData:(NSString *)period symbol:(NSString *)symbol complation:(void(^)(NSArray<KLineModel *> *models))complationBlock  {
//    NSArray *datas = [self getLocalData];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        complationBlock(datas);
//    });
     //    https://api.huobi.pro/market/history/kline?period=1min&size=300&symbol=btcusdt
    [_currentDataTask cancel];
    NSString *urls = [NSString stringWithFormat:@"https://api.huobi.pro/market/history/kline?period=%@&size=300&symbol=%@",period,symbol];
    NSURL *url = [[NSURL alloc] initWithString:urls];
    
    NSURLRequest *requst = [[NSURLRequest alloc] initWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requst completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:nil];
            NSArray<NSDictionary *> *dicts = dict[@"data"];
            NSArray *lines = [NSArray yy_modelArrayWithClass:[KLineModel class] json:dicts];
//            NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
//            for (int i = 0; i < dicts.count; i++) {
//                NSDictionary *item = dicts[i];
//                [array addObject:[[KLineModel alloc] initWithDict:item]];
//            }
            dispatch_async(dispatch_get_main_queue(), ^{
                complationBlock(lines);
            });
        } else {
            NSArray *datas = [self getLocalData];
            dispatch_async(dispatch_get_main_queue(), ^{
                complationBlock(datas);
            });
        }
    }];
    [dataTask resume];
}

-(NSArray<KLineModel *> *)getLocalData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"kline5" ofType:@"json"];
    NSDate *data = [[NSData alloc] initWithContentsOfURL: [[NSURL alloc] initFileURLWithPath:path]];
    NSArray<NSDictionary *> *dicts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:nil];
    NSArray *kLineModels = [NSArray yy_modelArrayWithClass:[KLineModel class] json:dicts];
    return kLineModels;
}



@end
