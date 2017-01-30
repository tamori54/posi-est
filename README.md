# Trilateration usin Beacons

This is an application you used in experiments.

## Description

The important points of this program are the following two functions.

**- Convert RSSI to distance -**
```ViewController.m
/*RSSIを距離へ変換*/

-(CGFloat)value:(float)num power:(int)val{
    CGFloat ans,x,k;
    k = 2;  //フリスの伝達公式
    x = (num+val)/(-10*k);
    ans = powf(10, x);
    return ans;
}
```
**- Calculation of position coordinates using trilateration -**
```ViewController.m
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

```
