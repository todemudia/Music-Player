//
//  ViewController.m
//  Assignment3
//  Name: Triumph Joshua Odemudia
//  ID: 201094546
//  Created by Josh Odemudia on 2017-05-12.
//  Copyright © 2017 Josh Odemudia. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    
    //declaration of variables
    NSOpenPanel *panel;
    NSString *info;
    NSURL *albumURL;
    NSImage *cover;
    NSURL *coverURL;
    bool isImageHidden;
    NSString *artistName;
    NSString *albumName;
    NSString *trackListString;
    NSString *currentlyPlaying;
    int currentSong;
    int arraySize;
    int currentVolume;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
    
}


//updates the value of the label when ever the volume is changed
- (IBAction)sliderbutton:(id)sender {
    currentVolume = [sender intValue];
    
    //changes the value of volume
    [self. sliderDisplay setIntValue: currentVolume];
    
}


- (IBAction)previousButton:(id)sender {
    
        if(currentSong >= 3){
            currentSong--;
            currentlyPlaying = self.trackList[currentSong];
            [self.currentlyPlayingLabel setStringValue: currentlyPlaying];
        }
        else if(currentSong < 3){/* Do Nothing */}
}

- (IBAction)playButton:(id)sender {
    
}

//Switches to the next song in the track list when clicked
- (IBAction)nextButton:(id)sender {
    if(currentSong <= (arraySize - 3)){
        currentSong++;
        currentlyPlaying = self.trackList[currentSong];
        [self.currentlyPlayingLabel setStringValue: currentlyPlaying];
        }
    else if(currentSong > (arraySize - 3)){/* do nothing */}
}

//Used to show and hide image
- (IBAction)hideImageButton:(id)sender {
    
    //returns a boolean representing i the image is hidden or not
    isImageHidden = [self.albumImage isHidden];
    
    //sets the image to show if it is hidden and to hidden if it is shown
    if(isImageHidden == false){
        [self.albumImage setHidden:true];
        [sender setTitle:@"Album Art"];
    }
    else if(isImageHidden == true){
        [self.albumImage setHidden:false];
        [sender setTitle:@"Track List"];
    }
}

- (IBAction)loadAlbumButton:(id)sender {
    //opens a panel to select a file for the album
    panel = [NSOpenPanel openPanel];
    
    //copies the panles URL to album url when user presses ok
    if ([panel runModal] == NSFileHandlingPanelOKButton) {
        albumURL = [panel URL];
        
        //Contains all text files from the chosen from the url
        info = [NSString stringWithContentsOfURL: albumURL encoding: NSASCIIStringEncoding error: NULL];
        
        //Converts the url from album url to a NSString
        NSString *temp = [albumURL path];
        
        //appends the string by adding .jpg at the end
        //makes it easy to access an album art for the file
        temp = [temp stringByAppendingString:@".jpg"];
        
        //Converts the url back to NSUrl and stores it in coverURL
        coverURL = [NSURL fileURLWithPath:temp];
        
        trackListString = @""; //declares track list to avoid a nil value in the string
        
        //stores the components of the songs into track lsit
        self.trackList = [info componentsSeparatedByString:@"\n"];
        
        //Gets the array
        arraySize = (int)[self.trackList count];
        
        for(int i = 0; i < (arraySize-1); i++){
            if(i == 0)
                {artistName = self.trackList[i];}
            else if(i == 1)
                {albumName = self.trackList[i];}
            else if(i > 1){
                trackListString = [trackListString stringByAppendingFormat:@"%d. ", (i-1)];
               trackListString = [trackListString stringByAppendingString: self.trackList[i]];
            }
        }
        
        currentSong = 2;
        currentlyPlaying = self.trackList[currentSong];
        [self.artistLabel setStringValue: artistName];
        [self.albumLabel setStringValue: albumName];
        [self.currentlyPlayingLabel setStringValue: currentlyPlaying];
        
        //sets the cover image
        cover = [[NSImage alloc] initWithContentsOfURL: coverURL];
        [self.albumImage setImage:cover];

        if(trackListString == nil){
             [self.listOfTracks setStringValue: @"fucking hell"];
        }
        //contains a list of tracks
        [self.listOfTracks setStringValue: trackListString];
    }
}

- (IBAction)findtextentered:(id)sender {
    currentSong = [self.findTrackTextField intValue] + 1;// adding one to avoid artist and album name being added to now playing
    
    //arraySize is substracted by 1 cause there is an empty string at the end
    if (currentSong > 1 && currentSong < (arraySize - 1)){
        currentlyPlaying = self.trackList[currentSong];
        [self.currentlyPlayingLabel setStringValue: currentlyPlaying];
    }
    
}

@end
