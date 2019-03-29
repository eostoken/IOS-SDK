# MathWalletSDK-iOS
#### iOS SDK based on SimpleWallet protocol
#### Supports public chains : ETH,EOS,EOSFORCE etc.
## How to use？
### 1、Deploy URL Schemes
#### Xcode Project info.plist-> URL types -> URL Schemes
![URL Schemes](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/urlschemes.jpeg "URL Schemes")
#### iOS9 or higher should set in info.plist as：
![URL Schemes](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/plist.jpeg "URL Schemes")
### 2、Register URL Schemes and set URL
```Objective C
#import <MathWalletSDK/MathWalletSDK.h>
 
 
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 // Override point for customization after application launch.
 [MathWalletAPI registerAppURLSchemes:@"mathwalletdemos"];
 return YES;
}
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
 BOOL handle = [MathWalletAPI handleURL:url result:^(MathWalletResp *resq) {
 NSLog(@"%@",resq.data);
 }];
 return handle;
}
@end
```
### 3、Login on MathWallet
```Objective C
 MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
 // sign of public chain
 loginReq.blockchain = @"eosio"; // eosio、eosforce、ethereum
 // DApp info
 loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
 loginReq.dappName = @"Demos";
 // DApp Server
 loginReq.uuID = @"currently uid";
 loginReq.loginUrl = @"login callback";
 loginReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
 loginReq.loginMemo = @"Memo";
[MathWalletAPI sendReq:loginReq];
```
### 4、Transfer on MathWallet
```Objective C
 MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
 // sign of public chain
 transferReq.blockchain = @"eosio"; // eosio、eosforce、ethereum
 // DApp info
 transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
 transferReq.dappName = @"Demos";
 // transfer info
 transferReq.from = @"eosioaccount";
 transferReq.to = @"eosioaccount";
 transferReq.amount = @"1.0000";
 transferReq.precision = @(4);
 transferReq.symbol = @"EOS";
 transferReq.contract = @"eosio.token";
 transferReq.dappData = @"notes";
transferReq.desc = @"describtions showed on Math Wallet";
 transferReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
 
 [MathWalletAPI sendReq:transferReq];
```
