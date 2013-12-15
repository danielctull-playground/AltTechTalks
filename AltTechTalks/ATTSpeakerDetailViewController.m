//
//  ATTSpeakerDetailViewController.m
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ATTSpeakerDetailViewController.h"
#import "AltTechTalks.h"

@interface ATTSpeakerDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *talkTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ATTSpeakerDetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.talkTitleLabel.text = self.speaker.talkTitle;
	self.nameLabel.text = self.speaker.name;

	NSURL *imageURL = [AltTechTalks URLForImageNamed:self.speaker.imageName inBundle:[AltTechTalks bundle]];
	self.imageView.image = [UIImage imageWithContentsOfFile:imageURL.path];

	// Lazy
	[self.detailWebView loadHTMLString:self.speaker.detail baseURL:nil];
}

@end
