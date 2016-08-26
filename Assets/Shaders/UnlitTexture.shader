Shader "Anclin/UnlitTexture"
{
	Properties
	{
		_MainTexture ("Main Texture", 2D) = "white" { }
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

			sampler2D _MainTexture;
			fixed4 _MainTexture_ST;

			struct vertexInput
			{
				float4 vertex : POSITION;
				fixed2 uv : TEXCOORD0;
			};

			struct vertexOutput
			{
				fixed4 pos : SV_POSITION;
				fixed2 uv : TEXCOORD0;
			};

			vertexOutput vert (vertexInput v)
			{
				vertexOutput o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = TRANSFORM_TEX( v.uv, _MainTexture );
				return o;
			}
			
			fixed4 frag (vertexOutput i) : SV_Target
			{
				return tex2D( _MainTexture, i.uv );
			}
			ENDCG
		}
	}
}
