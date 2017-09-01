// Parameter lines go here:
#pragma parameter HORIZ_GAUSS_WIDTH "Horiz Gauss Width" 0.5 0.0 1.0 0.01

#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying 
#define COMPAT_ATTRIBUTE attribute 
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 COL0;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING COMPAT_PRECISION float data_pix_no;
COMPAT_VARYING COMPAT_PRECISION float data_one;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;

#define vTexCoord TEX0.xy
#define SourceSize vec4(TextureSize, 1.0 / TextureSize) //either TextureSize or InputSize
#define outsize vec4(OutputSize, 1.0 / OutputSize)

void main()
{
    gl_Position = MVPMatrix * VertexCoord;
    COL0 = COLOR;
    TEX0.xy = TexCoord.xy;
    data_pix_no = vTexCoord.x * SourceSize.x;
    data_one    = SourceSize.z;
}

#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
uniform sampler2D Texture;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING COMPAT_PRECISION float data_pix_no;
COMPAT_VARYING COMPAT_PRECISION float data_one;

// compatibility #defines
#define Source Texture
#define vTexCoord TEX0.xy
#define texture(c, d) COMPAT_TEXTURE(c, d)
#define SourceSize vec4(TextureSize, 1.0 / TextureSize) //either TextureSize or InputSize
#define outsize vec4(OutputSize, 1.0 / OutputSize)

#ifdef PARAMETER_UNIFORM
// All parameter floats need to have COMPAT_PRECISION in front of them
uniform COMPAT_PRECISION float HORIZ_GAUSS_WIDTH;
#else
#define HORIZ_GAUSS_WIDTH 0.5
#endif

#define INV_SQRT_2_PI 0.38 // Doesn't have to be accurate.

void main()
{
    float texel      = floor(data_pix_no);
    float phase      = data_pix_no - texel;
    float base_phase = phase - 0.5;
    vec2 tex         = vec2((texel + 0.5) * SourceSize.z, vTexCoord.y);

    vec3 col = vec3(0.0);
    for (float i = -2.0; i <= 2.0; i++)
    {
        float phase = base_phase - float(i);
        float g = INV_SQRT_2_PI * exp(-0.5 * phase * phase / (HORIZ_GAUSS_WIDTH * HORIZ_GAUSS_WIDTH)) / HORIZ_GAUSS_WIDTH;
        col += texture(Source, tex + vec2(float(i) * data_one, 0.0)).rgb * g;
    }

    FragColor = vec4(col, 1.0);
} 
#endif
