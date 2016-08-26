Shader "Anclin/UnlitColor"
{
	Properties
	{
		_Color ("Main Color", COLOR) = (1,1,1,1)
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			fixed4 _Color;

			struct vertexInput
			{
				float4 vertex : POSITION;
			};

			struct vertexOutput
			{
				fixed4 pos : SV_POSITION;
			};

			
			vertexOutput vert (vertexInput v)
			{
				vertexOutput o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			fixed4 frag (vertexOutput i) : COLOR
			{
				return _Color;
			}
			ENDCG
		}
	}
}
