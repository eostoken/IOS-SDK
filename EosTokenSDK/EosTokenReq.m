//
//  EosTokenReq.m
//  EosTokenSDK
//
//  Created by ben on 10/12/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "EosTokenReq.h"

@implementation EosTokenReq
-(instancetype)init{
    self = [super init];
    if (self) {
        _protocol = @"SimpleWallet";
        _version = @"1.0";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"protocol"] = self.protocol;
    params[@"version"] = self.version;
    params[@"blockchain"] = self.blockchain;
    params[@"dappName"] = self.dappName;
    params[@"dappIcon"] = self.dappIcon;
    params[@"action"] = self.action;
    return params.copy;
}
@end


@implementation EosTokenLoginReq
-(instancetype)init{
    self = [super init];
    if (self) {
        self.action = @"login";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams].mutableCopy;
    params[@"uuID"] = self.uuID;
    params[@"loginUrl"] = self.loginUrl;
    params[@"expired"] = self.expired;
    params[@"loginMemo"] = self.loginMemo;
    return params.copy;
}
@end

@implementation EosTokenTransferReq
-(instancetype)init{
    self = [super init];
    if (self) {
        self.action = @"transfer";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams].mutableCopy;
    params[@"from"] = self.from;
    params[@"to"] = self.to;
    params[@"amount"] = self.amount;
    params[@"contract"] = self.contract;
    params[@"symbol"] = self.symbol;
    params[@"precision"] = self.precision;
    params[@"dappData"] = self.dappData;
    
    params[@"desc"] = self.desc;
    params[@"expired"] = self.expired;
    return params.copy;
}
@end

@implementation EosTokenTransactionReq
-(instancetype)init{
    self = [super init];
    if (self) {
        self.action = @"transaction";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams].mutableCopy;
    params[@"from"] = self.from;
    if(self.actions){
        params[@"actions"] = self.actions;
    }
    if (self.contract) {
        params[@"contract"] = self.contract;
    }
    params[@"desc"] = self.desc;
    params[@"expired"] = self.expired;
    return params.copy;
}
@end

@implementation EosTokenSignMessageReq : EosTokenReq

-(instancetype)init{
    self = [super init];
    if (self) {
        self.action = @"signMessage";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams].mutableCopy;
    params[@"message"] = self.message;
    params[@"isHex"] = self.isHex;
    params[@"desc"] = self.desc;
    return params.copy;
}
@end

@implementation EosTokenOpenURLReq : EosTokenReq

-(instancetype)init{
    self = [super init];
    if (self) {
        self.action = @"openUrl";
    }
    return self;
}

-(NSDictionary *)toParams{
    NSMutableDictionary *params = [super toParams].mutableCopy;
    params[@"dappUrl"] = self.dappUrl;
    params[@"desc"] = self.desc;
    return params.copy;
}
@end
