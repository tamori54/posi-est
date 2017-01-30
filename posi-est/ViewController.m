//
//  ViewController.m
//  iBeaconTest00
//
//  Created by tamori on 2015/09/10.
//  Copyright (c) 2015年 morita. All rights reserved.
//

#import "ViewController.h"
#import "math.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface
ViewController () <CLLocationManagerDelegate>{
    
}

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *m1;
@property (weak, nonatomic) IBOutlet UILabel *m2;
@property (weak, nonatomic) IBOutlet UILabel *m3;
@property (weak, nonatomic) IBOutlet UILabel *m4;
@property (weak, nonatomic) IBOutlet UILabel *m5;
@property (weak, nonatomic) IBOutlet UILabel *m6;
@property (weak, nonatomic) IBOutlet UIImageView *b1;
@property (weak, nonatomic) IBOutlet UIImageView *b2;
@property (weak, nonatomic) IBOutlet UIImageView *b3;
@property (weak, nonatomic) IBOutlet UIImageView *b4;
@property (weak, nonatomic) IBOutlet UIImageView *b5;
@property (weak, nonatomic) IBOutlet UIImageView *b6;
@property (weak, nonatomic) IBOutlet UIImageView *man;
@property (weak, nonatomic) IBOutlet UISwitch *sw;
@property (weak, nonatomic) IBOutlet UILabel *timer;
- (IBAction)deleteCircle:(id)sender;
- (IBAction)switch:(UISwitch *)sender;
-(void)TimerAction;

-(CGFloat)value:(float)num power:(int)val;

- (CGPoint)manPoint:(CGPoint)a beaconB:(CGPoint)b beaconC:(CGPoint)c distanceA:(CGFloat)dA distanceB:(CGFloat)dB distanceC:(CGFloat)dC;
//- (CGPoint)mPoint:(CGFloat)a beaconB:(CGFloat)b distance:(CGPoint)dis;

-(void)makeCircle:(CGFloat)x makeCircley:(CGFloat)y;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //locationManagerクラスのインスタンス作成
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    
    [_locationManager requestAlwaysAuthorization]; // iOS8
    
    _m1.font = [UIFont fontWithName:@"AppleGothic" size:10];
    _m2.font = [UIFont fontWithName:@"AppleGothic" size:10];
    _m3.font = [UIFont fontWithName:@"AppleGothic" size:10];
    _m4.font = [UIFont fontWithName:@"AppleGothic" size:10];
    _m5.font = [UIFont fontWithName:@"AppleGothic" size:10];
    _m6.font = [UIFont fontWithName:@"AppleGothic" size:10];
    
    
    //確認
    /*
    float x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6;
    x1=196.5201;
    y1=280.0663;
    x2=134.2729;
    y2=227.9779;
    x3=208.9202;
    y3=358.8410;
    x4=147.2303;
    y4=425.0859;
    x5=193.4162;
    y5=418.0057;
    x6=180.5851;
    y6=433.4041;
    CGRect rect1 = CGRectMake(0, 0, 8, 8);
    
    circle *circle1 = [[circle alloc]initWithFrame:rect1];
    circle1.tag =1;
    circle1.center = CGPointMake(x1, y1);
    //[self.view addSubview:circle1];
    
    circle *circle2 = [[circle alloc]initWithFrame:rect1];
    circle2.tag =1;
    circle2.center = CGPointMake(x2, y2);
    //[self.view addSubview:circle2];
    
    circle *circle3 = [[circle alloc]initWithFrame:rect1];
    circle3.tag =1;
    circle3.center = CGPointMake(x3, y3);
    //[self.view addSubview:circle3];
    
    circle *circle4 = [[circle alloc]initWithFrame:rect1];
    circle4.tag =1;
    circle4.center = CGPointMake(x4, y4);
    //[self.view addSubview:circle4];
    
    circle *circle5 = [[circle alloc]initWithFrame:rect1];
    circle5.tag =1;
    circle5.center = CGPointMake(x5, y5);
    //[self.view addSubview:circle5];
    
    circle *circle6 = [[circle alloc]initWithFrame:rect1];
    circle6.tag =1;
    circle6.center = CGPointMake(x6, y6);
    //[self.view addSubview:circle6];
     */
    //CGPoint pt = [self manPoint:CGPointMake(140, 318) beaconB:CGPointMake(227, 318) beaconC:CGPointMake(140,498) distanceA:2.8862 distanceB:3.5557 distanceC:2.2009];
    
    
    
    //　机の位置計算用
    float dis1,dis2,dis3;
    dis1 = 1.587;
    dis2 = 4.627;
    dis3 = 1.677;
    
    CGPoint pt = [self manPoint:CGPointMake(140, 318) beaconB:CGPointMake(141,498) beaconC:CGPointMake(227,405) distanceA:dis1*44 distanceB:dis2*44 distanceC:dis3*44];
    
    _man.center = pt;
     
     
     
     
    /*
    // ホームディレクトリを取得
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/log.csv"];
    
    // ファイルマネージャを作成
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    
    // ファイルを移動
    BOOL result = [fileManager removeItemAtPath:filePath error:&error];
    if (result) {
        NSLog(@"ファイルを削除に成功：%@", filePath);
    } else {
        NSLog(@"ファイルの削除に失敗：%@", error.description);
    }
    */
    
    
    
    
    
    
    
    
    
     
    
    /* ファイルやディレクトリの一覧を表示する
    NSArray *list = [fileManager contentsOfDirectoryAtPath:filePath
                                                     error:&error];
    
    for (NSString *path in list) {
        NSLog(@"%@", path);
    }
     */
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ビーコン監視を停止
-(void)chkBeaconStop{
    NSString *uuid = @"00000000-175C-1001-B000-001C4D1DA67D";
    CLBeaconRegion *region = [[CLBeaconRegion alloc]
                              initWithProximityUUID:[[NSUUID alloc]initWithUUIDString:uuid] identifier:@"MyBeacon"];
    [_locationManager stopRangingBeaconsInRegion:region];
}

//
// ビーコン監視を開始
//
-(void) chkBeaconStart{
    //対象のBeacon領域を作成
    NSString *uuid = @"00000000-175C-1001-B000-001C4D1DA67D";
    CLBeaconRegion *region = [[CLBeaconRegion alloc]
                              initWithProximityUUID:[[NSUUID alloc]initWithUUIDString:uuid] identifier:@"MyBeacon"];
    [_locationManager startRangingBeaconsInRegion:region];
    
}

//
// ビーコンが検出された場合
//
-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
    if (beacons.count > 0) {
        typedef struct _beacon{
            CGFloat x;
            CGFloat y;
            CGFloat dis;
        }Beacon;
        const int N = 7;
        Beacon be[N];
        Beacon *p[N],*t;
        
        //Beacon beacon1,beacon2,beacon3,beacon4;;
        int flag = 0;
        CGFloat k = 44;     //倍率
    
    //for (CLBeacon *beacon in beacons) {
            //CLBeacon *beacon = beacons.firstObject;
        for (int i = 0; i<beacons.count; i++) {
            
            NSNumber *a = [NSNumber numberWithInt:1];
            NSNumber *b = [NSNumber numberWithInt:2];
            NSNumber *c = [NSNumber numberWithInt:3];
            NSNumber *d = [NSNumber numberWithInt:4];
            NSNumber *e = [NSNumber numberWithInt:5];
            NSNumber *f = [NSNumber numberWithInt:6];
            CLBeacon *beacon = beacons[i];
            float prox = 0.01;
            
            if ([beacon.minor isEqualToNumber:a]) {
                CGFloat dis = [self value:beacon.rssi power:64];
                _m1.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                //机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                
                be[1].dis = dis*k;
                be[1].x = _b1.center.x;
                be[1].y = _b1.center.y;
                //dis1 = dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[1].x,be[1].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            else if([beacon.minor isEqualToNumber:b]){
                CGFloat dis = [self value:beacon.rssi power:64];
                _m2.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                //机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                
                be[2].dis = dis*k;
                be[2].x = _b2.center.x;
                be[2].y = _b2.center.y;
                //dis2 =dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[2].x,be[2].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            else if([beacon.minor isEqualToNumber:c]){
                CGFloat dis = [self value:beacon.rssi power:60];
                _m3.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                // 机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                 
                
                be[3].dis = dis*k;
                be[3].x = _b3.center.x;
                be[3].y = _b3.center.y;
                //dis3 = dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[3].x,be[3].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            else if([beacon.minor isEqualToNumber:d]){
                CGFloat dis = [self value:beacon.rssi power:58];
                _m4.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                // 机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                
                be[4].dis = dis*k;
                be[4].x = _b4.center.x;
                be[4].y = _b4.center.y;
                //dis4 = dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[4].x,be[4].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            else if([beacon.minor isEqualToNumber:e]){
                CGFloat dis = [self value:beacon.rssi power:61];
                _m5.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                // 机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                
                be[5].dis = dis*k;
                be[5].x = _b5.center.x;
                be[5].y = _b5.center.y;
                //dis4 = dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[5].x,be[5].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            else if([beacon.minor isEqualToNumber:f]){
                CGFloat dis = [self value:beacon.rssi power:63];
                _m6.text = [NSString stringWithFormat:@"RSSI = %ld, Major = %@, Minor = %@, Distance = %f",(long)beacon.rssi,beacon.major,beacon.minor,dis];
                // 机の位置
                //NSLog(@",%@,%f",beacon.minor,dis);
                
                be[6].dis = dis*k;
                be[6].x = _b6.center.x;
                be[6].y = _b6.center.y;
                //dis4 = dis*k;
                if (dis <= prox) {
                    CGPoint pt = CGPointMake(be[6].x,be[6].y);
                    _man.center = pt;
                    flag = 1;
                }
            }
            
        }
        
        if (flag == 0) {
            /*お試し
            CGPoint pt = [self manPoint:CGPointMake(100, 100) beaconB:CGPointMake(160, 120) beaconC:CGPointMake(70, 150) distanceA:50.00 distanceB:36.06 distanceC:60.83];
             */
            
            //NSLog(@"dis1 = %f, dis2 = %f, dis3 = %f",dis1,dis2,dis3);
            //NSLog(@"dis1 x=%f y=%f, dis2 x=%f y=%f,dis3 x=%f y=%f,dis4 x=%f y=%f",be[1].x,be[1].y,be[2].x,be[2].y,be[3].x,be[3].y,be[4].x,be[4].y);
            
            //ソート
            
            for(int i=1; i<N ;i++){
                p[i] = &be[i];
            }
            //NSLog(@"dis1=%f, dis2=%f, dis3=%f, dis4=%f",p[1]->dis,p[2]->dis,p[3]->dis,p[4]->dis);
            
            for (int i=1; i<N-1; i++) {
                for (int j=N-1; j>i; j--) {
                    if(p[j]->dis < p[j-1]->dis){
                        t=p[j];p[j]=p[j-1];p[j-1]=t;
                    }
                    //NSLog(@"dis[j] = %f; dis[j-1] = %f",p[j]->dis, p[j-1]->dis);
                }
            }
            
            //位置推定のインスタンスへ
            
            //NSLog(@"dis1=%f, dis2=%f, dis3=%f, dis4=%f",p[1]->dis,p[2]->dis,p[3]->dis,p[4]->dis);
            //NSLog(@"dis1 x=%f y=%f, dis2 x=%f y=%f,dis3 x=%f y=%f,dis4 x=%f y=%f",p[1]->x,p[1]->y,p[2]->x,p[2]->y,p[3]->x,p[3]->y,p[4]->x,p[4]->y);
            
            
            
            //ポイント描画
            CGPoint pt = [self manPoint:CGPointMake(be[1].x, be[1].y) beaconB:CGPointMake(be[2].x, be[2].y) beaconC:CGPointMake(be[3].x, be[3].y) distanceA:be[1].dis distanceB:be[2].dis distanceC:be[3].dis];
             
            
            
            
            //CGPoint pt = [self manPoint:CGPointMake(p[1]->x, p[1]->y) beaconB:CGPointMake(p[2]->x, p[2]->y) beaconC:CGPointMake(p[3]->x, p[3]->y) distanceA:p[1]->dis distanceB:p[2]->dis distanceC:p[3]->dis];
             
            _man.center = pt;
            
            
        }
        
//ファイル作成

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,
                                                             YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"log.csv"];
        
        // freopen関数で標準エラー出力をファイルに保存する
        freopen([path cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);

 

    }
}

-(void)TimerAction{
    if(countTime>0){
        countTime--;
        [_timer setText:[NSString stringWithFormat:@"%d",countTime]]; // ラベルに時間を表示
    }else{
        [timer invalidate]; // タイマーを停止する
        _sw.on = NO;
        [self chkBeaconStop];
        self.view.backgroundColor = [UIColor whiteColor];
        _m1.hidden = YES;
        _m2.hidden = YES;
        _m3.hidden = YES;
        _m4.hidden = YES;
        _m5.hidden = YES;
        _m6.hidden = YES;
        
    }
}

    //円の削除
-(IBAction)deleteCircle:(id)sender{
    for(UIView *view in [self.view subviews]){
        [[view viewWithTag:1] removeFromSuperview];
    }
}
//スイッチが押されたら
- (IBAction)switch:(UISwitch *)sender {
    if(sender.on==YES){
        timer = [NSTimer
                 scheduledTimerWithTimeInterval:1
                 target: self
                 selector:@selector(TimerAction)
                 userInfo:nil
                 repeats:YES];
        countTime = 60.0; //　設定時間
        [self chkBeaconStart];
        self.view.backgroundColor = [UIColor greenColor];
        _man.hidden = YES;
        //_man.hidden = NO;
        _b1.hidden = YES;
        _b2.hidden = YES;
        _b3.hidden = YES;
        _b4.hidden = YES;
        _b5.hidden = YES;
        _b6.hidden = YES;
        _m1.hidden = NO;
        _m2.hidden = NO;
        _m3.hidden = NO;
        _m4.hidden = NO;
        _m5.hidden = NO;
        _m6.hidden = NO;

        
    }else{
        [timer invalidate];
        [self chkBeaconStop];
        self.view.backgroundColor = [UIColor whiteColor];
        _m1.hidden = YES;
        _m2.hidden = YES;
        _m3.hidden = YES;
        _m4.hidden = YES;
        _m5.hidden = YES;
        _m6.hidden = YES;

    }
}


   //円の描画
-(void)makeCircle:(CGFloat)x makeCircley:(CGFloat)y{
    CGRect rect1 = CGRectMake(0, 0, 8, 8);
    circle *circle1 = [[circle alloc]initWithFrame:rect1];
    circle1.tag =1;
    circle1.center = CGPointMake(x, y);
    [self.view addSubview:circle1];
}

/*RSSIを距離へ変換*/

-(CGFloat)value:(float)num power:(int)val{
    CGFloat ans,x,k;
    k = 2;  //フリスの伝達公式
    x = (num+val)/(-10*k);
    ans = powf(10, x);
    return ans;
}
 

/*位置座標を計算*/


- (CGPoint)manPoint:(CGPoint)a beaconB:(CGPoint)b beaconC:(CGPoint)c distanceA:(CGFloat)dA distanceB:(CGFloat)dB distanceC:(CGFloat)dC {
    
    CGFloat Va, Vb, x, y ;
    Va = ((powf(dB,2)-powf(dC, 2))-(powf(b.x, 2)-powf(c.x, 2))-(powf(b.y, 2)-powf(c.y, 2)))/2;
    Vb = ((powf(dB,2)-powf(dA, 2))-(powf(b.x, 2)-powf(a.x, 2))-(powf(b.y, 2)-powf(a.y, 2)))/2;
    //NSLog(@", va = %f, vb = %f",Va,Vb);
    
    y = (Vb*(c.x-b.x)-Va*(a.x-b.x))/((a.y-b.y)*(c.x-b.x)-(c.y-b.y)*(a.x-b.x));
    x = (Va-y*(c.y-b.y))/(c.x-b.x);
    //  位置推定用
    //NSLog(@", x = %f, y = %f",x,y);
    NSLog(@", %f, %f",x,y);
     
    [self makeCircle:x makeCircley:y];  //円の描画
    return CGPointMake(x, y);
}
//
// ビーコンが検出できなかった場合
// 位置情報、BluetoothがOFFのケースでも呼ばれることがある
//
-(void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error{
    
}



@end
