//
//  ProprietarioTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 25/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADInterstitialDelegate.h"

@class GADInterstitial;
@class GADRequest;

@class GADBannerView;

@interface ProprietarioTable : UITableViewController <GADInterstitialDelegate>{
    
    
}

@property (nonatomic, retain) NSMutableArray * proprietario;

@property(nonatomic, strong) GADBannerView *adBanner;
@property(nonatomic, strong) GADInterstitial *interstitial;

@end

