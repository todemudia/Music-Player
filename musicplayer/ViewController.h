//
//  ViewController.h
//  Assignment3
//  Name: Triumph Joshua Odemudia
//  ID: 201094546
//  Created by Josh Odemudia on 2017-05-12.
//  Copyright © 2017 Josh Odemudia. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

//Labels used to print album, artist and currently playing song
@property (weak) IBOutlet NSTextField *artistLabel;
@property (weak) IBOutlet NSTextField *albumLabel;
@property (weak) IBOutlet NSTextField *currentlyPlayingLabel;
@property (weak) IBOutlet NSTextField *sliderDisplay;

//Creates an array that stores all tracks for the lists of playable songs
@property (strong) NSArray *trackList;


//Text fields
@property (weak) IBOutlet NSTextField *findTrackTextField;
@property (weak) IBOutlet NSTextField *listOfTracks;

//Album picture
@property (weak) IBOutlet NSImageView *albumImage;

//Buttons
- (IBAction)sliderbutton:(id)sender;
- (IBAction)previousButton:(id)previouSender;
- (IBAction)playButton:(id)playSender;
- (IBAction)nextButton:(id)nextSender;
- (IBAction)hideImageButton:(id)sender;
- (IBAction)loadAlbumButton:(id)sender;
- (IBAction)findtextentered:(id)sender;
@end

