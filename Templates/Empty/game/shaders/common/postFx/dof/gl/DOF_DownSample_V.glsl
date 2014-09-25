//-----------------------------------------------------------------------------
// Copyright (c) 2012 GarageGames, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//-----------------------------------------------------------------------------

#include "../../../gl/hlslCompat.glsl"
#include "../../../gl/torque.glsl"

attribute vec4 vPosition;
attribute vec2 vTexCoord0;
attribute vec3 vTexCoord1;

#define IN_pos  vPosition
#define IN_tc vTexCoord0
#define IN_wsEyeRay vTexCoord1

varying vec4 position;
varying vec2 tcColor0;
varying vec2 tcDepth0;
varying vec2 tcDepth1;
varying vec2 tcDepth2;
varying vec2 tcDepth3;

uniform vec4    rtParams0;
uniform vec2    oneOverTargetSize;

void main()  
{
   vec2 uv = viewportCoordToRenderTarget( IN_tc, rtParams0 ); 

   tcColor0 = uv;

   tcDepth0 = uv + float2( -0.5, -0.0 ) * oneOverTargetSize;    
   tcDepth1 = uv + float2( -1.5, -0.0 ) * oneOverTargetSize;    
   tcDepth2 = uv + float2( +1.5, -0.0 ) * oneOverTargetSize;    
   tcDepth3 = uv + float2( +2.5, -0.0 ) * oneOverTargetSize;     
   
   gl_Position = vPosition;
}
