//
//  NarotaViewController.h
//  AVSound
//
//  Created by Amninder Singh Narota on 7/18/13.
//  Copyright (c) 2013 Amninder Singh Narota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVAudioPlayer.h>

int click=0;
@interface NarotaViewController : UIViewController <AVAudioPlayerDelegate> {
    NSURL *soundFile;
    AVAudioPlayer *sound;
    NSTimeInterval duration;
    IBOutlet UIButton *play;
    IBOutlet UILabel *label;
    IBOutlet UILabel *timeDisplay;
    NSString *mp3File;
    NSData *mp3Data;
    
}
- (IBAction)play:(id)sender;
- (IBAction)slider:(id)sender;
-(void)playSong;
-(void)updateTimeLeft;
@end
