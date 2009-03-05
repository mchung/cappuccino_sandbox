/*
 * AppController.j
 *
 * Created by Marc Chung on 03/05/2009.
 * Copyright 2009 OpenRain, LLC. All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <Foundation/CPURLRequest.j>
@import <Foundation/CPURLConnection.j>

@implementation AppController : CPObject
{
  CPTextField label;
  CPView contentView;
  CPWindow theWindow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
  contentView = [theWindow contentView];

  var request = [CPURLRequest requestWithURL:"/data"];
  var connection = [CPURLConnection connectionWithRequest:request delegate:self];

  label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
  [label setFont:[CPFont boldSystemFontOfSize:24.0]];
  [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];

  [contentView addSubview:label];
  
  [theWindow orderFront:self];
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)data
{
  CPLog.trace(data);
  [label setStringValue:data];
  [label sizeToFit];
  [label setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - CGRectGetWidth([label frame])) / 2.0, (CGRectGetHeight([contentView bounds]) - CGRectGetHeight([label frame])) / 2.0)];
}

@end
