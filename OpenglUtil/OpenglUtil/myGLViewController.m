//
//  myGLViewController.m
//  OpenglUtil
//
//  Created by topgene on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "myGLViewController.h"
#import "helloGLObject.h"

@implementation myGLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    glObject = [[helloGLObject alloc] initContext:NO];
    [glObject setRenderGLView:(GLKView*)self.view];
    
    [glObject setupGL];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [glObject tearDownGL];
    
    if ([EAGLContext currentContext] == glObject.glContext) {
        [EAGLContext setCurrentContext:nil];
    }
    
    [glObject release];
    glObject = nil;
}

#pragma mark - GLKView and GLKViewController delegate methods

- (void)update
{
    [glObject update:self.timeSinceLastUpdate];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [glObject render];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


- (void)dealloc
{
    [glObject release];
    glObject = nil;
    [super dealloc];
}


@end
