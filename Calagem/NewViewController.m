//
//  NewViewController.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 09/10/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "NewViewController.h"
#import "PBWebViewController.h"
#import "PBSafariActivity.h"


@interface NewViewController ()

@end

@implementation NewViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Initialize the web view controller and set it's URL
    self.webViewController = [[PBWebViewController alloc] init];
    self.webViewController.URL = [NSURL URLWithString:@"http://www.promastersolution.com.br/cotacoes.html"];
    
    // These are custom UIActivity subclasses that will show up in the UIActivityViewController
    // when the action button is clicked
    PBSafariActivity *activity = [[PBSafariActivity alloc] init];
    self.webViewController.applicationActivities = @[activity];
    
    // This property also corresponds to the same one on UIActivityViewController
    // Both properties do not need to be set unless you want custom actions
    self.webViewController.excludedActivityTypes = @[UIActivityTypeMail, UIActivityTypeMessage, UIActivityTypePostToWeibo];
    
    // Push it
    [self.navigationController pushViewController:self.webViewController animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
