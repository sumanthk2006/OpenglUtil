//
//  pytGLObject.m
//  OpenglUtil
//
//  Created by topgene on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "pytGLObject.h"

@implementation pytGLObject

@synthesize renderGLView = _renderGLView;
@synthesize glContext = _glContext;

- (void)setRenderGLView:(GLKView *)renderGLView
{
    _renderGLView = renderGLView;
    _renderGLView.context = self.glContext;
    _renderGLView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
}

- (id)initContext:(BOOL)useGL1
{
    self = [super init];
    if (self != nil) {
        if (useGL1) {
            self.glContext = [[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1] autorelease];
        }
        else
        {
            self.glContext = [[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2] autorelease];
        }
        
        
        if (!self.glContext) {
            NSLog(@"Failed to create ES context");
        }
    }
    return self;
}

- (void)setupGL
{
    [EAGLContext setCurrentContext:self.glContext];
}
- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.glContext];
}
- (void)render
{
    
}
- (void)update:(float)dTime
{
    
}

- (void) dealloc
{
    if ([EAGLContext currentContext] == self.glContext) {
        [EAGLContext setCurrentContext:nil];
    }
    self.glContext = nil;
    [super dealloc];
}

@end
