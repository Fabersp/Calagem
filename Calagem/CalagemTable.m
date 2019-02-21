//
//  CalagemTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 26/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "AppDelegate.h"
#import "CalagemTable.h"
#import "CalagemNovaTable.h"
#import "CalagemCell.h"
#import "GADBannerView.h"
#import "GADRequest.h"
#import "PDFRenderer.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import "PDFViewController.h"
#import "MTPopupWindow.h"
#import "GADInterstitialDelegate.h"

#define INTERSTITIAL_AD_UNIT_ID @"ca-app-pub-6439752646521747/3360842512"
#define simulador @"377d635157683106a48cd155a9d9bb8a"


@interface CalagemTable ()

@end

@implementation CalagemTable

@synthesize Calagem;
@synthesize myWebView;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)CarregarTimer{
     [self.interstitial presentFromRootViewController:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   /* [NSTimer scheduledTimerWithTimeInterval:15.0
                                     target:self
                                   selector:@selector(CarregarTimer)
                                   userInfo:nil
                                    repeats:NO];
   */
   // AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //***** botão esquerdo ***** ///
    UIBarButtonItem *editButton = self.editButtonItem;
    editButton.title = @"Editar";
    editButton.tintColor = [UIColor whiteColor];
    [editButton setTarget:self];
    [editButton setAction:@selector(toggleEdit)];
    self.navigationItem.leftBarButtonItem = editButton;
    
    // ***** Botão direito **** //
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (GADRequest *)request {
    GADRequest *request = [GADRequest request];
    
    request.testDevices = [NSArray arrayWithObjects:
                           GAD_SIMULATOR_ID, simulador, nil];
    return request;
}

#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.


- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    GADBannerView *bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    bannerView_.adUnitID = INTERSTITIAL_AD_UNIT_ID;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
    

   /*   float width = tableView.bounds.size.width;
    int fontSize = 18;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, fontSize)];
    view.backgroundColor = [UIColor colorWithWhite:40 alpha:0];
    view.userInteractionEnabled = YES;
    view.tag = section;
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anuncie_Fotor.jpg"]];
    
    image.contentMode = UIViewContentModeScaleAspectFit;
    
    [view addSubview:image];
    
  UIWebView *tempWebview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, width, fontSize)];
    
    NSString *urlAddress = @"http://www.apple.com";
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    self.myWebView = view;
    
    myWebView.delegate = self;
 
    [tempWebview loadRequest:requestObj];
    
    [view addSubview:tempWebview];
   */
   /* UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(padding, 2, width - padding, fontSize)];
    label.text = @"Texto";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor darkGrayColor];
    label.shadowOffset = CGSizeMake(0,1);
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    
    [view addSubview:label]; */
   
    return bannerView_;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}


- (IBAction)toggleEdit {
    BOOL editing = !self.tableView.editing;
    self.navigationItem.rightBarButtonItem.enabled = !editing;
    if (editing) {
        self.navigationItem.leftBarButtonItem.title = @"Ok";
        //Added in the edition for this button has the same color of the UIBarButtonSystemItemDone
        self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStyleDone;
    }
    else{
        self.navigationItem.leftBarButtonItem.title = @"Editar";
        //Added in the edition for this button has the same color of the UIBarButtonSystemItemDone
        self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStylePlain;
    }
    [self.tableView setEditing:editing animated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Apagar";
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext * context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [context deleteObject:[Calagem objectAtIndex:indexPath.row]];
    }
    
    NSError * error = nil;
    if (![context save:&error]) {
        NSLog(@"Não foi possível deletar!");
        return;
    }
    
    [Calagem removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSManagedObjectContext * moc = [self managedObjectContext];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Calagem"];
    Calagem = [[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return Calagem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalagemCell *cell = (CalagemCell *)[tableView dequeueReusableCellWithIdentifier:@"CalagemCell"];
    
    NSManagedObject * calagem = [Calagem objectAtIndex:indexPath.row];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    cell.LbProprietario.text   = [calagem valueForKey:@"proprietario"];
    cell.Propriedade.text      = [calagem valueForKey:@"propriedade"];
    cell.DataCalagem.text      = [calagem valueForKey:@"data"];
    cell.Amostra.text          = [calagem valueForKey:@"amostra"];
    cell.ResultadoCalagem.text = [NSString stringWithFormat:@"%@ (t/ha).",[formatter stringForObjectValue:[calagem valueForKey:@"resultado"]]];
    cell.LegendaResultado.text = [calagem valueForKey:@"legendaResultado"];
    
    double ValorResult = [cell.ResultadoCalagem.text doubleValue];
    
    if (ValorResult > 0) {
        cell.ResultadoCalagem.textColor = [UIColor redColor];
        cell.LegendaResultado.textColor = [UIColor redColor];
    }
    if (ValorResult < 0) {
        cell.ResultadoCalagem.textColor = [UIColor blackColor];
        cell.LegendaResultado.textColor = [UIColor blackColor];
    }
    
    cell.btnEnviarEmail.tag = indexPath.row;
      

    return cell;
}

-(IBAction)btnGerarPDF:(id)sender{
    
    
    
}





-(IBAction)btnEnviarEmail:(id)sender{
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate= (id)self;
        [mail setSubject:@"PDF File"];
        
        ///1 Set up the proper arguments to obtain the generated file in the previous saved file directory.
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *file = [documentsDirectory stringByAppendingPathComponent:@"Calagem.pdf"];
        NSData *data = [NSData dataWithContentsOfFile:file];
        
        [PDFRenderer drawPDF:file];
        
        /// Set up argument to attach PDF to email.
        [mail addAttachmentData:data mimeType:@"application/pdf" fileName:@"Calagem.pdf"];
        [self presentViewController:mail animated:YES completion:^{NSLog (@"Action Completed");}];

    }
    else
    {
        NSLog(@"Message cannot be sent");
    }
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"MAIL FINISHED"); }];
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"UpdateCalagem"]) {
        NSManagedObject * selectedCar = [Calagem objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        CalagemNovaTable * destViewController = segue.destinationViewController;
        destViewController.calagem = selectedCar;
        destViewController.title = @"Editar";
    }
    if ([[segue identifier] isEqualToString:@"GerarPDF"]) {
        NSManagedObject * selectedCar = [Calagem objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        PDFRenderer * destViewController = segue.destinationViewController;
        destViewController.calagem = selectedCar;
        //destViewController.title = @"PDF";
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  

  //  CalagemNovaTable * detalhes = [[CalagemNovaTable alloc]init];
  //  [self.navigationController pushViewController:detalhes animated:YES];
  // CalagemNovaTable *EditarCalagem = [[CalagemNovaTable alloc] initWithWindowNibName:@"CalagemNovaTable"];
  // [controllerWindow showWindow:self];
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
