//
//  pytGLObject.h
//  OpenglUtil
//
//  Created by topgene on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface pytGLObject : NSObject
{
    GLKView *_renderGLView;
    EAGLContext *_glContext;
}

@property (nonatomic, assign) GLKView *renderGLView;
@property (nonatomic, retain) EAGLContext *glContext;

- (id)initContext:(BOOL)useGL1;

- (void)setupGL;
- (void)tearDownGL;
- (void)render;
- (void)update:(float)dTime;
@end
