//
//  ViewController.h
//  iBeaconTest00
//
//  Created by tikomo on 2014/12/10.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "circle.h"

@interface ViewController : UIViewController{
    NSTimer *timer;
    int countTime;
    //UISwitch *sw;
}

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

