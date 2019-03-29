//
//  EosTokenResp.h
//  EosTokenSDK
//
//  Created by ben on 10/12/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 * @brief 处理结果
 */
typedef NS_ENUM(NSUInteger, EosTokenRespResult) {
    EosTokenRespResultCanceled = 0,               // 取消
    EosTokenRespResultSuccess,                    // 成功
    EosTokenRespResultFailure,                    // 失败
};

/*!
 * @brief   响应回调
 * @discuss data    action=transfer -> data={"txID":"交易ID"}
 *                  action=login -> data=nil
 */

@interface EosTokenResp : NSObject
@property (nonatomic, assign) EosTokenRespResult result;      // 处理结果
@property (nonatomic, copy) NSString *action;      // 处理类型
@property (nonatomic, copy) NSDictionary *data;                 // 附加数据
@end
