//
//  AgronomoTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 25/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerViewDelegate.h"
#import "GADInterstitial.h"
#import "GADInterstitialDelegate.h"


@class GADBannerView, GADRequest, GADInterstitial;

@interface AgronomoTable : UITableViewController <GADBannerViewDelegate, GADInterstitialDelegate> {
    GADInterstitial *interstitial_;
   // UITableView *tableView_;
}
@property(nonatomic, strong) GADBannerView *adBanner;
@property(nonatomic, retain) GADInterstitial *interstitial;
@property (nonatomic, retain) NSMutableArray * Agronomos;
//@property(nonatomic,retain) IBOutlet UITableView *tableView;

- (GADRequest *)request;


@end
