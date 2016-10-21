//
//  	VolumeSlider.m
//  	Volume Slider Cordova Plugin
//
//  	Created by Tommy-Carlos Williams on 20/07/11. Updated by Samuel Michelot on 11/05/1013
//  	Copyright 2011 Tommy-Carlos Williams. All rights reserved.
//      MIT Licensed
//

#import "VolumeSlider.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation VolumeSlider

@synthesize mpVolumeViewParentView, myVolumeView, callbackId;

#ifndef __IPHONE_3_0
@synthesize webView;
#endif

/*
-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
	[self pluginInitialize];
	return self;
}
*/

#pragma mark -
#pragma mark VolumeSlider

- (void) createVolumeSlider:(CDVInvokedUrlCommand *)command
{
	NSArray* arguments = [command arguments];
	NSString *color = @"default";

	self.callbackId = command.callbackId;
	NSUInteger argc = [arguments count];
	
	if (argc < 3) { // at a minimum we need x origin, y origin and width...
		return;
	}

	if (self.mpVolumeViewParentView != NULL) {
			return; //already created, don't need to create it again
	}

	CGFloat originx,originy,width;
	CGFloat height = 30;

	originx = [[arguments objectAtIndex:0] floatValue];
	originy = [[arguments objectAtIndex:1] floatValue];
	width 	= [[arguments objectAtIndex:2] floatValue];
	if (argc > 3) {
		height = [[arguments objectAtIndex:3] floatValue];
	}
	if (argc > 4) {
        color = [arguments objectAtIndex:4];
    }

	CGRect viewRect = CGRectMake(
								 originx,
								 originy,
								 width,
								 height
								 );

	self.mpVolumeViewParentView = [[UIView alloc] initWithFrame:viewRect];

	[self.webView.superview addSubview:mpVolumeViewParentView];

	mpVolumeViewParentView.backgroundColor = [UIColor clearColor];
	self.myVolumeView = [[MPVolumeView alloc] initWithFrame: mpVolumeViewParentView.bounds];
    if([color isEqual: @"default"]){
        //nothing to do
    }
    if([color isEqual: @"white"]){
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplaywhite"] forState:UIControlStateNormal];
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplayprimary"] forState:UIControlStateHighlighted];
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplayprimary"] forState:UIControlStateSelected];
    }
    if([color isEqual: @"black"]){
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplay"] forState:UIControlStateNormal];
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplayprimary"] forState:UIControlStateHighlighted];
        [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"icon-airplayprimary"] forState:UIControlStateSelected];
    }
	[mpVolumeViewParentView addSubview: myVolumeView];
	self.myVolumeView.showsVolumeSlider = NO;
	self.myVolumeView.showsRouteButton = NO;
}

- (void)showVolumeSlider:(CDVInvokedUrlCommand *)command
{
	BOOL enableRoute = [[command.arguments objectAtIndex:0] boolValue];
	BOOL enableSlider = [[command.arguments objectAtIndex:1] boolValue];

	if(enableSlider){
		self.myVolumeView.showsVolumeSlider = YES;
	} else {
		self.myVolumeView.showsVolumeSlider = NO;
	}
	if(enableRoute){
		self.myVolumeView.showsRouteButton = YES;
	} else {
		self.myVolumeView.showsRouteButton = NO;
	}

	self.mpVolumeViewParentView.hidden = NO;
}

- (void)hideVolumeSlider:(CDVInvokedUrlCommand *)command
{
	self.mpVolumeViewParentView.hidden = YES;
	self.myVolumeView.showsVolumeSlider = NO;
	self.myVolumeView.showsRouteButton = NO;
}

@end
