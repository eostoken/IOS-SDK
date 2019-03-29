//
//  EosTokenAPI.h
//  EosTokenSDK
//
//  Created by ben on 10/12/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EosTokenReq.h"
#import "EosTokenResp.h"
/*!
 * @class EosTokenAPI
 */
@interface EosTokenAPI : NSObject

/*!
 * @brief 注册URL Schemes
 * @param urlSchemes 在Xcode工程info.plist-> URL types -> URL Schemes里添加
 */
+ (void)registerAppURLSchemes:(NSString *)urlSchemes;

/*!
 * @brief 向 EosToken 发起请求
 * @param req 登录/转账
 * @return YES/NO
 */
+ (BOOL)sendReq:(EosTokenReq *)req;

/*!
 * @brief   处理EosToken的回调
 * @discuss 在AppDelegate -(application:openURL:options:)方法里调用
 */
+ (BOOL)handleURL:(NSURL *)url result:(void(^)(EosTokenResp *resq))result;
//+ (NSMutableDictionary *)getURLParameters:(NSString *)parameterString;
+(BOOL)openURL:(NSURL *)url;
@end
