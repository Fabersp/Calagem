//
//  BuscarProprietarioTable.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 28/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "BuscarProprietarioTable.h"
#import "CalagemNovaTable.h"
#import "GADInterstitialDelegate.h"
#import "GADBannerView.h"
#import "GADRequest.h"

#define INTERSTITIAL_AD_UNIT_ID @"ca-app-pub-6439752646521747/3360842512"
#define simulador @"377d635157683106a48cd155a9d9bb8a"

@interface BuscarProprietarioTable ()

@end

@implementation BuscarProprietarioTable

@synthesize proprietario;
@synthesize textoProprietario;
@synthesize textoPropriedade;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.interstitial presentFromRootViewController:self];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSManagedObjectContext * moc = [self managedObjectContext];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Proprietario"];
    proprietario = [[moc executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}
- (IBAction)SelecionarProprietario:(id)sender {
    
    NSManagedObject * Agronomo = [proprietario objectAtIndex:SelecionadoIndex.row];
    
    textoProprietario.text = [Agronomo valueForKey:@"nomeProprietario"];
    textoPropriedade.text  = [Agronomo valueForKey:@"propriedade"];
    
   
  //  textoProprietario.text = @"proprietario";
  //  textoPropriedade.text = @"propriedade";
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return proprietario.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIndentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier forIndexPath:indexPath];
    
    NSManagedObject * Agronomo = [proprietario objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[Agronomo valueForKey:@"nomeProprietario"]];
    [cell.detailTextLabel setText:[Agronomo valueForKey:@"propriedade"]];
    
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *oldIndex = [self.tableView indexPathForSelectedRow];
    
    [self.tableView cellForRowAtIndexPath:oldIndex].accessoryType = UITableViewCellAccessoryNone;
    
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    SelecionadoIndex = indexPath;
    
    return indexPath;
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
