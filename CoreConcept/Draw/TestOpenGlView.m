//
//  TestOpenGlView.m
//  testdown
//
//  Created by rjb on 2018/5/15.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestOpenGlView.h"

@implementation TestOpenGlView


- (void)drawRect:(CGRect)rect {
    glClearColor(0.0f, 0.0f, 0.1f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    // Draw using previously configured texture, shader, uniforms, and vertex array
//    glBindTexture(GL_TEXTURE_2D, _planetTexture);
//    glUseProgram(_diffuseShading);
//    glUniformMatrix4fv(_uniformModelViewProjectionMatrix, 1, 0, _modelViewProjectionMatrix.m);
//    glBindVertexArrayOES(_planetMesh);
//    glDrawElements(GL_TRIANGLE_STRIP, 256, GL_UNSIGNED_SHORT);

}



@end
