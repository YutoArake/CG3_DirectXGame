#include "BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	// 点ストリーム
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;							// 出力用頂点データ 
	element.normal = input[0].normal;	// 法線をコピー
	element.uv = input[0].uv;				// UVをコピー
	
	element.svpos = input[0].svpos;		// 頂点座標をコピー
	output.Append(element);				// 頂点を１つ出力(出力リストに追加)

	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0.0f, 0.0f);
	output.Append(element);				// 頂点を１つ出力(出力リストに追加)

	element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0.0f, 0.0f);
	output.Append(element);				// 頂点を１つ出力(出力リストに追加)
}

// 三角形の入力から、点を1つ出力するサンプル
//[maxvertexcount(1)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// 出力用頂点データ 
//	element.svpos = input[i].svpos;		// 頂点座標をコピー
//	element.normal = input[i].normal;	// 法線をコピー
//	element.uv = input[i].uv;				// UVをコピー
//	output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//}

// 三角形の入力から、点を3つ出力するサンプル
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;							// 出力用頂点データ 
//		element.svpos = input[i].svpos;		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		element.uv = input[i].uv;				// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//	}
//}

// 三角形の出力から、線分を１つ出力するサンプル
//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// 出力用頂点データ 
//
//	// 線分の始点
//	element.svpos = input[0].svpos;		// 頂点座標をコピー
//	element.normal = input[0].normal;	// 法線をコピー
//	element.uv = input[0].uv;				// UVをコピー
//	output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//
//	// 線分の終点
//	element.svpos = input[1].svpos;		// 頂点座標をコピー
//	element.normal = input[1].normal;	// 法線をコピー
//	element.uv = input[1].uv;				// UVをコピー
//	output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//}

// 三角形の出力から、線分を3つ出力するサンプル
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// 出力用頂点データ 
//
//	for (uint i = 0; i < 3; i++) {
//		// 線分の始点
//		element.svpos = input[i].svpos;		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		element.uv = input[i].uv;				// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//
//		// 線分の終点
//		if (i == 2) {
//			// +1すると溢れるので、最初に戻る
//			element.svpos = input[0].svpos;		// 頂点座標をコピー
//			element.normal = input[0].normal;	// 法線をコピー
//			element.uv = input[0].uv;				// UVをコピー
//		}
//		else {
//			element.svpos = input[i + 1].svpos;		// 頂点座標をコピー
//			element.normal = input[i + 1].normal;	// 法線をコピー
//			element.uv = input[i + 1].uv;				// UVをコピー
//		}
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//		// 現在のストリップを終了し、次のストリップを開始
//		output.RestartStrip();
//	}
//}

// 三角形の出力から、線分を3つ出力するサンプル
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// 出力用頂点データ 
//
//	// 3角形の頂点を一点ずつ扱う
//	for (uint i = 0; i < 3; i++) {
//		// 線分の始点
//		element.svpos = input[i].svpos;		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		element.uv = input[i].uv;				// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//	}
//	// 最初の点をもう一度追加
//	element.svpos = input[0].svpos;		// 頂点座標をコピー
//	element.normal = input[0].normal;	// 法線をコピー
//	element.uv = input[0].uv;				// UVをコピー
//	output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//}

// 三角形の入力から、三角形を出力するが、
// 途中でUVを加工してタイリング
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// 出力用頂点データ 
//		element.svpos = input[i].svpos;		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		// UVを2倍に
//		element.uv = input[i].uv * 2.0f;		// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//	}
//}

// 三角形の入力から、三角形を2つ出力
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout TriangleStream< GSOutput > output
//)
//{
//	// 1つ目の三角形
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// 出力用頂点データ 
//		element.svpos = input[i].svpos;		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		element.uv = input[i].uv;				// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//	}
//	// 現在のストリップを終了
//	output.RestartStrip();
//
//	// 2つ目の三角形
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// 出力用頂点データ 
//		// X方向に20ずらす
//		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);		// 頂点座標をコピー
//		element.normal = input[i].normal;	// 法線をコピー
//		// UVを5倍に
//		element.uv = input[i].uv * 5.0f;		// UVをコピー
//		output.Append(element);				// 頂点を１つ出力(出力リストに追加)
//	}
//}