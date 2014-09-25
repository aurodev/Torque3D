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

#include "farFrustumQuad.glsl"

attribute vec4 vPosition;
attribute vec3 vTangent;
attribute vec3 vNormal;
attribute vec2 vTexCoord0;

uniform vec4 rtParams0;

varying vec4 hpos;
varying vec2 uv0;
varying vec3 wsEyeRay;
varying vec3 vsEyeRay;

void main()
{
   // Expand the SS coordinate (stored in uv0)
   //hpos = vec4( vTexCoord0.xy * 2.0 - 1.0, 1.0, 1.0 );
   hpos = vec4( vTexCoord0, 0, 1 );  
   gl_Position = hpos;
   
   // Get a RT-corrected UV from the SS coord
   uv0 = getUVFromSSPos( hpos.xyz, rtParams0 );
   
   // Interpolators will generate eye ray from far-frustum corners
   wsEyeRay = vTangent.xyz;
   vsEyeRay = vNormal;
}
