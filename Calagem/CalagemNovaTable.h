//
//  CalagemNovaTable.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDateSelectionViewController.h"
#import "RMPickerViewController.h"
#import "GADInterstitial.h"
#import "GADInterstitialDelegate.h"

@class GADInterstitial;
@class GADRequest;


@interface CalagemNovaTable : UITableViewController <RMDateSelectionViewControllerDelegate, RMPickerViewControllerDelegate, GADInterstitialDelegate> {
   
    IBOutlet UITextField * txtProprietario;
    IBOutlet UITextField * txtPropriedade;
    NSString * ValorFinal;

}

@property (strong) NSManagedObject * calagem;
@property(nonatomic, strong) GADInterstitial *interstitial;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingSpinner;

@property (nonatomic, retain) NSString * strProprietario, * strPropriedade, * ValorFinal;


@property (nonatomic, retain) NSMutableArray * listaSelect;
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;
@property (nonatomic, retain) IBOutlet UITextField *txtProprietario;
@property (nonatomic, retain) IBOutlet UITextField *txtPropriedade;
@property (weak, nonatomic) IBOutlet UITextField *txtSolo;
@property (weak, nonatomic) IBOutlet UITextField *txtCultivo;
@property (weak, nonatomic) IBOutlet UITextField *txtData;
@property (weak, nonatomic) IBOutlet UITextField *txtPrnt;
@property (weak, nonatomic) IBOutlet UITextField *txtElementok;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoCa;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoMg;
@property (weak, nonatomic) IBOutlet UITextField *txtElementoHAL;
@property (weak, nonatomic) IBOutlet UITextField *LbResultadoV2;
@property (weak, nonatomic) IBOutlet UITextField *txtAmostra;
@property (weak, nonatomic) IBOutlet UITextField *txtResultadoSB;
@property (weak, nonatomic) IBOutlet UITextField *txtResultadoCTC;
@property (weak, nonatomic) IBOutlet UITextField *txtResultadoV1;
@property (weak, nonatomic) IBOutlet UILabel *LbResultadoFinal;

@property (weak, nonatomic) IBOutlet UILabel *LbLegendaResultado;




@end
