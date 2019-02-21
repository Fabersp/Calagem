//
//  CalagemTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerViewDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import "GADInterstitialDelegate.h"

@class GADBannerView, GADRequest;

@interface CalagemTable : UITableViewController <MFMailComposeViewControllerDelegate, GADBannerViewDelegate, GADInterstitialDelegate> {
    
    UIWebView *myWebView;
}
@property (nonatomic, retain) UIWebView *myWebView;

@property (nonatomic, retain) NSMutableArray * Calagem;
@property(nonatomic, strong) GADBannerView *adBanner;
@property(nonatomic, strong) GADInterstitial *interstitial;

-(NSString*)getPDFFileName;


@end
