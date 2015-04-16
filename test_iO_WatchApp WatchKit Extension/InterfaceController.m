//
//  InterfaceController.m
//  test_iO_WatchApp WatchKit Extension
//
//  Created by Yannik Zimmermann on 30.03.15.
//  Copyright (c) 2015 Yannik Zimmermann. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];


    // Configure interface objects here.
}

- (void)handleActionWithIdentifier:(NSString *)identifier
             forRemoteNotification:(NSDictionary *)remoteNotification {

    if ([identifier  isEqual: @"firstButtonAction"]) {
        NSArray* initialPhrases = @[@"Let's do lunch.", @"Can we meet tomorrow?", @"When are you free?", @"When are you free?", @"When are you free?", @"When are you free?", @"When are you free?", @"When are you free?", @"When are you free?"];
        [self presentTextInputControllerWithSuggestions:initialPhrases
                                       allowedInputMode:WKTextInputModeAllowAnimatedEmoji
                                             completion:^(NSArray *results) {
                                                 if (results && results.count > 0) {
                                                     id aResult = [results objectAtIndex:0];
                                                     // Use the string or image.
                                                     NSLog(@"%@",aResult);
                                                 }
                                                 else {
                                                     NSLog(@"nothing else was selected");
                                                     // Nothing was selected.
                                                 }
                                             }];
    }

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



