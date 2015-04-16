//
//  CallNotificationController.m
//  test_iO_WatchApp
//
//  Created by Yannik Zimmermann on 08.04.15.
//  Copyright (c) 2015 Yannik Zimmermann. All rights reserved.
//

#import "CallNotificationController.h"
#import "UIImage+BlurredFrame.h"


@interface CallNotificationController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblCaller;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *grpBlurredBackground;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *imgCallerAvatar;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *grpCallerAvatarRadius;

@end


@implementation CallNotificationController

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

    NSString * Name = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"sender"];
    NSString * imagePath = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"image"];
    
    UIImage * callerAvatar = [UIImage imageNamed:@"profilbild"/*imagePath*/];
    UIImage * backgroundImage = callerAvatar;
    
    // Set blur for background
    CGFloat radius = 8;
    CGRect frame = CGRectMake(0, 0, backgroundImage.size.width,backgroundImage.size.height);
    UIColor *tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    backgroundImage = [backgroundImage applyBlurWithRadius:radius tintColor:tintColor saturationDeltaFactor:true maskImage:nil/*backgroundImage*/ atFrame:frame];
    
    CGRect device = [[WKInterfaceDevice currentDevice] screenBounds];
    CGFloat cornerRadius = device.size.width < 156 ? 20 : 22.5;
    
    NSLog(@"%f", device.size.width);
    
    [_grpCallerAvatarRadius setCornerRadius:cornerRadius];
    [_grpBlurredBackground setBackgroundImage:backgroundImage];
    [_imgCallerAvatar setImage:callerAvatar];
    [_lblCaller setText:Name];
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end



