//
//  BuscarProprietarioTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 28/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADInterstitialDelegate.h"
#import "GADBannerView.h"
#import "GADRequest.h"


@interface BuscarProprietarioTable : UITableViewController <GADInterstitialDelegate, GADBannerViewDelegate> {
    
    NSIndexPath * SelecionadoIndex;
    UITextField * textoProprietario;
    UITextField * textoPropriedade;
}

@property (nonatomic, retain) NSMutableArray * proprietario;

@property (nonatomic, retain) UITextField * textoProprietario;
@property (nonatomic, retain) UITextField * textoPropriedade;

@property(nonatomic, strong) GADBannerView *adBanner;
@property(nonatomic, strong) GADInterstitial *interstitial;

@end
