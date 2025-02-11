//
//  AppDelegate.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 25/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate> {
   
    NSString * texto;

    
    

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *deviceToken, * texto;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@property(nonatomic, readonly) NSString *interstitialAdUnitID;



@end
