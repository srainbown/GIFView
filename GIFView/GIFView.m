//
//  GIFView.m
//  GIFView
//
//  Created by 紫川秀 on 2017/12/5.
//  Copyright © 2017年 dangbei. All rights reserved.
//

#import "GIFView.h"
#import <QuartzCore/QuartzCore.h>

@interface GIFView (){
    
    CGImageSourceRef _gifRef;
    NSDictionary *_gifPropertiesDict;//gif的字典属性，定义了gif的一些特殊内容，这里虽然设置了，但是没啥特殊设置，一般情况下可以设置为NULL
    size_t _index;
    size_t _count;
    NSTimer *_timer;
    
}

@end

@implementation GIFView

-(id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath andInterval:(float)time{
    self = [super initWithFrame:frame];
    if (self) {
        //设置gif的属性来获取gif的图片信息
        _gifPropertiesDict = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        //这个是拿到图片的信息
        _gifRef = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:filePath], (CFDictionaryRef)_gifPropertiesDict);
        //这个拿到的是图片的张数，一张gif其实内部是有好几张图片组合在一起的，如果是普通图片的话，拿到的数就等于1
        _count = CGImageSourceGetCount(_gifRef);
        _timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(play) userInfo:nil repeats:YES];
        [_timer fire];
        self.userInteractionEnabled = NO;
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame data:(NSData *)data andInterval:(float)time{
    self = [super initWithFrame:frame];
    if (self) {
        _gifPropertiesDict = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        _gifRef = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)_gifPropertiesDict);
        _count = CGImageSourceGetCount(_gifRef);
        _timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(play) userInfo:nil repeats:YES];
        [_timer fire];
    }
    return self;
}

-(void)play{
    
    _index ++;
    _index = _index%_count;
    //方法的内容是根据上面拿到的imageSource来获取gif内部的第几张图片，拿到后在进行layer重新填充
    CGImageRef ref = CGImageSourceCreateImageAtIndex(_gifRef, _index, (CFDictionaryRef)_gifPropertiesDict);
    self.layer.contents = (__bridge id)ref;
    CFRelease(ref);
    
}

-(void)removeFromSuperview{
    
    NSLog(@"removeFromSuperview");
    [_timer invalidate];
    _timer = nil;
    [super removeFromSuperview];
    
}

@end
