
//  BlockchainTableViewController.m
//  EosTokenSDK
//
//  Created by ben on 10/12/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import "BlockchainTableViewController.h"
#import "EosTokenAPI.h"

@interface BlockchainTableViewController ()

@end

@implementation BlockchainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EosTokenSDK-Demos";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36.f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {

        case 0:{             // EOSIO
            switch (indexPath.row) {
                case 0:
                    [self eosio_login];
                    break;
                case 1:
                    [self eosio_transfer];
                    break;
                case 2:
                    [self eosio_signMessage];
                    break;
                case 3:
                    [self eosio_custom_transaction];
                    break;
                default:
                    [self eosio_openURL];
                    break;
            }
            break;
        }
      
        default:
            break;
    }
}

#pragma mark -  EOSIO
-(void)eosio_openURL{
    EosTokenOpenURLReq *openURLReq = [[EosTokenOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"eosio";
    // DApp信息
    openURLReq.dappIcon = @"https://ndx.340wan.com/static/logo-white-bg.png";
    openURLReq.dappName = @"EosTokenSDK-Demos";
    // 链接信息
    openURLReq.dappUrl = @"http://www.eostoken.im";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [EosTokenAPI sendReq:openURLReq];
}
-(void)eosio_signMessage{
    EosTokenSignMessageReq *signMessageReq = [[EosTokenSignMessageReq alloc] init];
    // 公链标识
    signMessageReq.blockchain = @"eosio";
    // DApp信息
    signMessageReq.dappIcon = @"https://ndx.340wan.com/static/logo-white-bg.png";
    signMessageReq.dappName = @"EosTokenSDK-Demos";
    // 签名信息
    signMessageReq.message = @"我是要签名的信息";
    signMessageReq.isHex = @(NO);
    signMessageReq.desc = @"这是展示在钱包中的描述";
    
    [EosTokenAPI sendReq:signMessageReq];
}
-(void)eosio_login{
    
    EosTokenLoginReq *loginReq = [[EosTokenLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"eosio";
    // DApp信息
    loginReq.dappIcon = @"https://ndx.340wan.com/static/logo-white-bg.png";
    loginReq.dappName = @"EosTokenSDK-Demos";
    // DApp Server
    loginReq.uuID = @"5CF6B69A-48CC-4149-8932-03EF077A231D";
    loginReq.loginUrl = @"http://www.eostoken.im";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    loginReq.loginMemo = @"Memo";
    [EosTokenAPI sendReq:loginReq];
}

-(void)eosio_transfer{
    EosTokenTransferReq *transferReq = [[EosTokenTransferReq alloc] init];
    // 公链标识
    transferReq.blockchain = @"eosio";
    // DApp信息
    transferReq.dappIcon = @"https://ndx.340wan.com/static/logo-white-bg.png";
    transferReq.dappName = @"EosTokenSDK-Demos";
    // 转账信息
    transferReq.from = @"appstoregood";
    transferReq.to = @"chengengping";
    transferReq.amount = @"0.2500";
    transferReq.precision = @(4);
    transferReq.symbol = @"EOS";
    transferReq.contract = @"eosio.token";
    transferReq.dappData = @"memo";
    
    transferReq.desc = @"这是展示在钱包中的描述";
    transferReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [EosTokenAPI sendReq:transferReq];
}
-(void)eosio_custom_transaction{
    EosTokenTransactionReq *transactionReq = [[EosTokenTransactionReq alloc] init];
    // 公链标识
    transactionReq.blockchain = @"eosio";
    // DApp信息
    transactionReq.dappIcon = @"https://ndx.340wan.com/static/logo-white-bg.png";
    transactionReq.dappName = @"BTEX";
    // 转账信息
    transactionReq.from = @"yuzhiyou1234";
    transactionReq.actions = @[
                               @{
                                   @"code":@"eosbtexbonus",
                                   @"action":@"redeembt",
                                   @"binargs":@"200a9ba67d5fab69030000000000000060070b01000000000442540000000000"
                                   }
                               ];
    
    transactionReq.desc = @"这是展示在钱包中的描述";
    transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [EosTokenAPI sendReq:transactionReq];
}

@end
