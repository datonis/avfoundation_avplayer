//
//  NarotaViewController.m
//  AVSound
//
//  Created by Amninder Singh Narota on 7/18/13.
//  Copyright (c) 2013 Amninder Singh Narota. All rights reserved.
//

#import "NarotaViewController.h"

@interface NarotaViewController (){
    NSTimer *timer;
}
@property (nonatomic, retain) NSTimer *timer;
@end

@implementation NarotaViewController
@synthesize timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLeft) userInfo:nil repeats:YES];
    
    label.text=[NSString stringWithFormat:@"0"];
    
    mp3File = @"http://www.amninder.com/spectrum/static.mp3";
    mp3Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:mp3File]];
    
    soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                        pathForResource:@"kid" ofType:@"mp3"]];
    //sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFile error:nil];
    NSError *e = nil;
    sound = [[AVAudioPlayer alloc] initWithData:mp3Data error:&e];
    sound.delegate = self;
    if(sound==nil){
        NSLog(@"Shit happened");
    }else{
        NSLog(@"I am on!");
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    NSLog(@"ਤੇਰੀ");
    [self playSong];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if(click==0){
        click=1;
        [play setTitle:@"Stop" forState:UIControlStateNormal];
    }else{
        click=0;
        [play setTitle:@"Play" forState:UIControlStateNormal];
    }
}

-(void) playSong{
    NSLog(@"inside playSong");
    if(click==0){
        click=1;
        [sound play];
        [play setTitle:@"Stop" forState:UIControlStateNormal];
    }else{
        click=0;
        [sound stop];
        [play setTitle:@"Play" forState:UIControlStateNormal];
    }
}

- (IBAction)slider:(id)sender {
    UISlider *slide = (UISlider *)sender;
    int fonts = (float)(slide.value);
    NSString *newText = [NSString stringWithFormat:@"%d", (int)fonts];
    label.font = [UIFont systemFontOfSize:fonts];
    if(fonts<10){
        label.font = [UIFont systemFontOfSize:10];
    }
    label.text = newText;
    sound.volume=fonts/100;
    NSLog(@"Volume: %f", (float)fonts/100);
}

-(void)updateTimeLeft{
    NSLog([NSString stringWithFormat:@"%f", sound.duration-sound.currentTime]);
    [timeDisplay setText:[NSString stringWithFormat:@"%f", sound.duration-sound.currentTime]];
}
@end
