Shader "Anclin/DisplayNormals"
{
	Properties
	{
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

			struct vertexInput
			{
				float4 vertex : POSITION;
				fixed3 normal : NORMAL;
			};

			struct vertexOutput
			{
				fixed4 pos : SV_POSITION;
				fixed3 col : COLOR;
			};

			
			vertexOutput vert (vertexInput v)
			{
				vertexOutput o;
				o.col = fixed4(v.normal, 1) * 0.5 + 0.5;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			fixed4 frag (vertexOutput i) : COLOR
			{
				return fixed4(i.col, 1);
			}
			ENDCG
		}
	}
}
