//
//  msgPictureNotificationControllerFull.m
//  test_iO_WatchApp
//
//  Created by Yannik Zimmermann on 08.04.15.
//  Copyright (c) 2015 Yannik Zimmermann. All rights reserved.
//

#import "msgPictureNotificationControllerFull.h"
#import "UIImage+BlurredFrame.h"

@interface msgPictureNotificationControllerFull()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblName;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *grpBackground;

@property (weak, nonatomic) IBOutlet WKInterfaceGroup *grpBackgroundSize;

@end


@implementation msgPictureNotificationControllerFull

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

- (UIImage *)resizeImageProportional:(UIImage *)originalImage width:(NSInteger)maxWidth height:(NSInteger)maxHeight {
    UIImage *newImage;
    NSInteger width =maxWidth;
    NSInteger height = maxHeight;
    CGFloat quotient;
    
    if (originalImage.size.width >= originalImage.size.height)
    {
        quotient = originalImage.size.height/originalImage.size.width;
        if (maxWidth*quotient > maxHeight)
        {
            height = maxHeight;
            width = height/quotient;
        }
        else
        {
            width = maxWidth;
            height = maxWidth*quotient;
        }
    }
    else
    {
        quotient = originalImage.size.width/originalImage.size.height;
        if (maxHeight*quotient > maxWidth)
        {
            width = maxWidth;
            height = width/quotient;
        }
        else
        {
            height = maxHeight;
            width = maxHeight*quotient;
        }
    }
        
    CGSize newSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(newSize, YES, originalImage.scale);
    [originalImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
    
    CGFloat labelHeight = 25;
    
    //get image
    NSString * Message = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
    NSString * imagePath = [[[remoteNotification objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"image"];
    UIImage * originalImage = [UIImage imageNamed:@"beachpanorama"/*imagePath*/];
    CGRect device = [[WKInterfaceDevice currentDevice] screenBounds];
    UIImage * newImage = [self resizeImageProportional:originalImage width:device.size.width height:99999];
    
    //size group
    CGFloat adjustedImageHeight = MAX(40 + labelHeight, MIN(110 + labelHeight, newImage.size.height));
    CGFloat cropOffset = (newImage.size.height - adjustedImageHeight) / 2;
    
    CGRect frame;
    
    //frame = CGRectMake(0, cropOffset - 50, newImage.size.width, cropOffset -50);

    frame = CGRectMake(0, newImage.size.height - cropOffset - labelHeight, newImage.size.width, labelHeight + 5);

//    if (height >= 110) {
//        //frame = CGRectMake(0, (newImage.size.height - cropOffset) - 50, newImage.size.width, (newImage.size.height -cropOffset) - 50);
//        frame = CGRectMake(0, (newImage.size.height - cropOffset) - labelHeight , newImage.size.width, labelHeight);
//    }else {
//        frame = CGRectMake(0, newImage.size.height - labelHeight, newImage.size.width, newImage.size.height - labelHeight);
//    }
   
    
    newImage = [newImage applyLightEffectAtFrame:frame];
    
    NSLog(@"%f,%f,%f, %f",adjustedImageHeight, newImage.size.height, newImage.size.width, cropOffset);
    //set group,image,msg
    [_grpBackground setBackgroundImage:newImage];
    [_grpBackgroundSize setHeight:adjustedImageHeight - labelHeight];
    [_lblName setText:Message];
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end



