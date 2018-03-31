Shader "Tut/Shader/Terrain/MyGrass" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		sampler2D _MainTex;
		struct Input {
			float2 uv_MainTex;
		};
		void vert(inout appdata_full v)
		{
			v.vertex.xz*=(1+_SinTime.w/10);
		}
		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
