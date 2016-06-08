//
//  ViewController.m
//  StatusBarValue
//
//  Created by Yanase Yuji on 2016/06/09.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelAntennaBar;
@property (weak, nonatomic) IBOutlet UILabel *labelRssi;
@property (weak, nonatomic) IBOutlet UILabel *labelBatteryCapa;

- (IBAction)buttonGetValue:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonGetValue:(id)sender {
    
    self.labelAntennaBar.text  = [NSString stringWithFormat:@"%zd", [self antennaBar]];
    self.labelRssi.text        = [NSString stringWithFormat:@"%zd", [self radioRssi]];
    self.labelBatteryCapa.text = [NSString stringWithFormat:@"%zd", [self batteryCapacity]];
}

#pragma mark - Status bar
- (NSInteger )antennaBar {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSString *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarSignalStrengthItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    
     return  [[dataNetworkItemView valueForKey:@"signalStrengthBars"] intValue];
}

- (NSInteger )radioRssi {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSString *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarSignalStrengthItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    
    return  [[dataNetworkItemView valueForKey:@"signalStrengthRaw"] intValue];
}

- (NSInteger)batteryCapacity {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSString *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarBatteryItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    
    return [[dataNetworkItemView valueForKey:@"capacity"] intValue];
}

@end
