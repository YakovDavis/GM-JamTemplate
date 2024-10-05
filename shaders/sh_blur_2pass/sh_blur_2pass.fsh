
#define BLUR_RAD 8

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vInvRes;
uniform bool u_bVertical;

void main()
{
	float weights[BLUR_RAD];
	weights[0] = 0.1974; weights[1] = 0.1747; weights[2] = 0.1210; weights[3] = 0.0656;
	weights[4] = 0.0278; weights[5] = 0.0092; weights[6] = 0.0024; weights[7] = 0.0005;
	
	vec4 initialCol = texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 col = initialCol.xyz * weights[0];
	
	vec2 delta = vec2(0.0, 0.0);
	if (u_bVertical)
	{
		delta.x = u_vInvRes.x;
	}
	else
	{
		delta.y = u_vInvRes.y;
	}
	
	for (int i = 1; i < BLUR_RAD; ++i)
	{
		col += texture2D(gm_BaseTexture, v_vTexcoord + delta * float(i)).rgb * weights[i];
		col += texture2D(gm_BaseTexture, v_vTexcoord - delta * float(i)).rgb * weights[i];
	}
	
	gl_FragColor = v_vColour * vec4(col, initialCol.a);
}
