﻿Shader "Anclin/DiffuseColor"
{
	Properties
	{
		_Color ("Main Color", COLOR) = (1,1,1,1)
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" }
		Tags { "LightMode" = "ForwardBase" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			// includes
//			#include "UnityCG.cginc"

			// user defined variables
			uniform float4 _Color;

			// Unity defined variables
			uniform float4 _LightColor0;

			struct vertexInput{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct vertexOutput{
				float4 pos : SV_POSITION;
				float4 col : COLOR;
			};

			
			vertexOutput vert (vertexInput v){
				vertexOutput o;

                float3 normalDirection = normalize( mul( float4( v.normal, 0.0 ), _World2Object ).xyz );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 diffuseReflection = max( 0.0, dot(normalDirection, lightDirection) ) * _LightColor0;
                float3 lightFinal = diffuseReflection;

                o.col = float4( lightFinal * _Color.rgb, 1.0 );
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			float4 frag (vertexOutput i) : COLOR{
				return i.col;
			}
			ENDCG
		}
	}
}
