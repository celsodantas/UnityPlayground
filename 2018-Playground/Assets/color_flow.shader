Shader "Custom/color_flow" {
	Properties {
		_Intensity("Intensity", Range(0, 10)) = 1
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }

		Pass {
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			half _Intensity;

			struct OutPosition {
				float4 pos : SV_POSITION;
				float4 normal : NORMAL;
			};

			struct FragmentOutput {
				float4 color : SV_TARGET;
			};

			OutPosition vert(float4 pos : POSITION, float4 normal : NORMAL) {
				OutPosition o;
				o.pos = UnityObjectToClipPos(pos);
				o.normal = normal;

				return o;
			}

			FragmentOutput frag(OutPosition pos) {
				FragmentOutput o;
				o.color = abs(_SinTime.w);

				return o;
			}

			ENDCG
		}
	}
}
