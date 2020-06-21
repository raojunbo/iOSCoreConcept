//
//  SocketTool.m
//  CoreConcept
//
//  Created by rjb on 2020/6/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "SocketTool.h"
#import "SRWebSocket.h"
#import "NSObject+YYModel.h"
#import "NSData+GZIP.h"

@implementation SocketKLineResponse

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"ID":@"id"
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"data":[KLineModel class]
    };
}

@end

@interface SocketTool()<SRWebSocketDelegate>
@property (nonatomic, strong)SRWebSocket *webSocket;
@property (nonatomic, strong) NSMutableDictionary *requestDict;
@end

@implementation SocketTool

+ (instancetype)tool {
    static dispatch_once_t onceToken;
    static SocketTool *tool = nil;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

- (instancetype)init {
    if(self = [super init]){
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"wss://api.huobi.pro/ws"]];
        _webSocket = [[SRWebSocket alloc]initWithURLRequest:request];
        _webSocket.delegate = self;
        _requestDict = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)send:(NSDictionary *)messageDict responseBlock:(SocketResponseBlock)responseBlock {
    NSMutableDictionary *paramDict = [messageDict mutableCopy];
    NSString *requestID =  [self randomRequestId];
    [paramDict setObject:requestID forKey:@"id"];
    [self sendRequestId:requestID message:paramDict responseBlock:responseBlock];
}

- (void)sendRequestId:(NSString *)requestID
              message:(NSDictionary *)messageDict
        responseBlock:(SocketResponseBlock)responseBlock {
    NSString *messageStr = [messageDict yy_modelToJSONString];
    if(requestID){
        [self.requestDict setObject:[responseBlock copy] forKey:requestID];
    }
    [self.webSocket send:messageStr];
}

- (NSString *)randomRequestId {
    NSTimeInterval interval =  [NSDate timeIntervalSinceReferenceDate];
    return [NSString stringWithFormat:@"%@",[NSNumber numberWithInt:(int)interval]];
}

- (void)open {
    [self.webSocket open];
}

- (void)close {
    [self.webSocket close];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    self.isOpening = YES;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSData *data = [message gunzippedData];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    if([[jsonDict allKeys]containsObject: @"ping"]){
        NSString *pingID = [NSString stringWithFormat:@"%@",[jsonDict objectForKey:@"ping"]];
        NSDictionary *pongDict = @{@"pong":pingID};
        [self sendRequestId:nil message:pongDict responseBlock:nil];
        NSLog(@"ping:%@",jsonDict);
    }else{
        NSLog(@"response:%@",jsonDict);
        SocketKLineResponse *lineResponse = [SocketKLineResponse yy_modelWithJSON:jsonDict];
        if(lineResponse.ID){
            SocketResponseBlock responseBlock = [self.requestDict objectForKey:lineResponse.ID];
            if(responseBlock){
                responseBlock(lineResponse);
                [self.requestDict removeObjectForKey:lineResponse.ID];
            }
        }
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    self.isOpening = NO;
}

-  (BOOL)isBlankString:(NSString *)aStr {
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if([aStr isEqualToString:@"null"]){
        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

@end
