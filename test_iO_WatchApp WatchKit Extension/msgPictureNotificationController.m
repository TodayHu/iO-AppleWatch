//
//  NotificationController.m
//  test_iO_WatchApp WatchKit Extension
//
//  Created by Yannik Zimmermann on 30.03.15.
//  Copyright (c) 2015 Yannik Zimmermann. All rights reserved.
//

#import "msgPictureNotificationController.h"


@interface msgPictureNotificationController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblName;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *imgTextImage;
@end


@implementation msgPictureNotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

/*
 - (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
 // This method is called when a local notification needs to be presented.
 // Implement it if you use a dynamic notification interface.
 // Populate your dynamic notification interface as quickly as possible.
 //
 // After populating your dynamic notification interface call the completion block.
 completionHandler(WKUserNotificationInterfaceTypeCustom);
 }
 */


- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    NSString * Message = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
    NSString * imagePath = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"image"];
    UIImage * image = [UIImage imageNamed:imagePath];
    
    [_lblName setText:Message];
    [_imgTextImage setImage:image];
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



