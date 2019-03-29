# MathWalletSDK-iOS

#### SimpleWallet에 기반한 iOS SDK
#### ETH,EOS,EOSFORCE 등 메인넷 지원


## How to use？

### 1、URL Schemes 배치
#### Xcode info.plist-> URL types -> URL Schemes
![URL Schemes](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/urlschemes.jpeg "URL Schemes")

#### iOS9 이상은 info.plist에서 아래와 같이 설치해야 합니다：
![URL Schemes](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/plist.jpeg "URL Schemes")


### 2、URL Schemes 등록 및 URL 처리

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

### 3、MathWallet을 통해 로그인

```Objective C
  MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
  // 메인넷 표시
  loginReq.blockchain = @"eosio";   // eosio、eosforce、ethereum
  // DApp 정보
  loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
  loginReq.dappName = @"Demos";
  // DApp Server
  loginReq.uuID = @"이번 로그인uid";
  loginReq.loginUrl = @"로그인 리턴";
  loginReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
  loginReq.loginMemo = @"Memo";

  [MathWalletAPI sendReq:loginReq];
```

### 4、MathWallet을 통해 이체

```Objective C
  MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
  // 메인넷 표시
  transferReq.blockchain = @"eosio";  // eosio、eosforce、ethereum
  // DApp 정보
  transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
  transferReq.dappName = @"Demos";
  // 이체정보
  transferReq.from = @"eosioaccount";
  transferReq.to = @"eosioaccount";
  transferReq.amount = @"1.0000";
  transferReq.precision = @(4);
  transferReq.symbol = @"EOS";
  transferReq.contract = @"eosio.token";
  transferReq.dappData = @"비고";

  transferReq.desc = @"지갑에 전시된 묘사";
  transferReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
  
  [MathWalletAPI sendReq:transferReq];
```
