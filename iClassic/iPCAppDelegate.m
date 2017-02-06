//
//  iPCAppDelegate.m
//  iClassic
//
//  Created by Emilio Peláez on 4/30/13.
//  Copyright (c) 2013 Emilio Peláez. All rights reserved.
//

#import "iPCAppDelegate.h"
#import "iPCMainViewController.h"

@implementation iPCAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
	[application setStatusBarHidden:YES];
	
	[iPCColorsManager sharedInstance];
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	UIViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"Player Controller"];;
	
	if([MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized) {
		self.window.rootViewController = mainController;
	} else {
		[MPMediaLibrary requestAuthorization:^(MPMediaLibraryAuthorizationStatus status) {
			dispatch_sync(dispatch_get_main_queue(), ^{
				self.window.rootViewController = mainController;
			});
		}];
	}
	
	return YES;
}

@end
