//
//  Shader.fsh
//  OpenglUtil
//
//  Created by topgene on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
