//
//  SecondViewController.m
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 13/04/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "TerceiraTela.h"
#import <sys/utsname.h>

#import "GADBannerView.h"
#import "GADRequest.h"


@interface TerceiraTela ()

@end

@implementation TerceiraTela

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // [self Carregar_Banner];
   	   
    Contato.layer.cornerRadius = 10.0f;
    Contato.layer.masksToBounds = YES;
    
    Contar_amigo.layer.cornerRadius = 10.0f;
    Contar_amigo.layer.masksToBounds = YES;
    
    Comentario.layer.cornerRadius = 10.0f;
    Comentario.layer.masksToBounds = YES;
    
   // self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Fundo~iphone.png"]];

}



-(void)Carregar_Banner {
#define iphone 50
#define ipad 97
    
    NSInteger posicao_banner = 0;
    
    if (self.view.frame.size.height < 960) {
        posicao_banner = iphone;
    } else {
        posicao_banner = ipad;
    }
    
    // Initialize the banner at the up the tab bar.
    CGPoint origin = CGPointMake(0.0,
                                 self.view.frame.size.height -
                                 CGSizeFromGADAdSize(kGADAdSizeBanner).height -
                                 self.navigationController.navigationBar.frame.size.height -
                                 posicao_banner /* status bar */);
    
    // Initialize the banner at the bottom of the screen.
    /*   CGPoint origin = CGPointMake(0.0,
     self.view.frame.size.height -
     CGSizeFromGADAdSize(kGADAdSizeBanner).height);
     */
    
    // Use predefined GADAdSize constants to define the GADBannerView.
    self.adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait origin:origin];
    
    // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID before compiling.
    self.adBanner.adUnitID = @"ca-app-pub-6439752646521747/3360842512";
    self.adBanner.delegate = self;
    self.adBanner.rootViewController = self;
    [self.view addSubview:self.adBanner];
    [self.adBanner loadRequest:[self request]];
}

- (GADRequest *)request {
    GADRequest *request = [GADRequest request];
       
    request.testDevices = [NSArray arrayWithObjects:
                           GAD_SIMULATOR_ID, @"53434f5a4f0499df210a28721c0b74568d755c7c", nil];
    return request;
}

#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Received ad successfully");
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    //	[self dismissModalViewControllerAnimated:YES];
    [self becomeFirstResponder];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)Sugestoes:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [[mailer navigationBar] setTintColor:[UIColor whiteColor]];
        
        [mailer setSubject:@"Contato - App Calagem"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"fabricio_0505_@hotmail.com", nil];
        [mailer setToRecipients:toRecipients];
        // only for iPad
        mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:mailer animated:YES completion:^{NSLog (@"Action Completed");}];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha"
                                                        message:@"Este dispositivo não suporta o envio de e-mail."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)ContarAmigo:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [[mailer navigationBar] setTintColor:[UIColor whiteColor]];
        
        [mailer setSubject:@"App Calagem"];
        
        NSString *emailBody = @"Olá,\n\n Estou utilizando o App para calcular a calagem, ele está disponível para download. \n\n Baixe ele na Apple Store. http://goo.gl/NW9sHU";
        
        [mailer setMessageBody:emailBody isHTML:NO];
        
        // only for iPad
        mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:mailer animated:YES completion:^{NSLog (@"Action Completed");}];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha"
                                                        message:@"Este dispositivo não suporta o envio de e-mail."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)BtnAppConversorPago:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/conversor-agrario/id907981355?l=pt&ls=1&mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

- (IBAction)BtnAppColheita:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/programacao-da-colheita/id936528031?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}
- (IBAction)BtnAdubacao:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/soja/id924713049?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

- (IBAction)BtnGessagemCalagem:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/gessagem-calagem/id922285748?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

- (IBAction)BtnTemperatura:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/temperature-converter-2/id882262472?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

- (IBAction)BtnCalagem:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/calagem/id887326016?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

- (IBAction)BtnConversor:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/us/app/conversor-agrario/id907981355?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

@end
