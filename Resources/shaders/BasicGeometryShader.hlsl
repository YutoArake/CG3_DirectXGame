#include "BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	// �_�X�g���[��
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;							// �o�͗p���_�f�[�^ 
	element.normal = input[0].normal;	// �@�����R�s�[
	element.uv = input[0].uv;				// UV���R�s�[
	
	element.svpos = input[0].svpos;		// ���_���W���R�s�[
	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)

	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0.0f, 0.0f);
	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)

	element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0.0f, 0.0f);
	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
}

// �O�p�`�̓��͂���A�_��1�o�͂���T���v��
//[maxvertexcount(1)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// �o�͗p���_�f�[�^ 
//	element.svpos = input[i].svpos;		// ���_���W���R�s�[
//	element.normal = input[i].normal;	// �@�����R�s�[
//	element.uv = input[i].uv;				// UV���R�s�[
//	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//}

// �O�p�`�̓��͂���A�_��3�o�͂���T���v��
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;							// �o�͗p���_�f�[�^ 
//		element.svpos = input[i].svpos;		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		element.uv = input[i].uv;				// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//	}
//}

// �O�p�`�̏o�͂���A�������P�o�͂���T���v��
//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// �o�͗p���_�f�[�^ 
//
//	// �����̎n�_
//	element.svpos = input[0].svpos;		// ���_���W���R�s�[
//	element.normal = input[0].normal;	// �@�����R�s�[
//	element.uv = input[0].uv;				// UV���R�s�[
//	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//
//	// �����̏I�_
//	element.svpos = input[1].svpos;		// ���_���W���R�s�[
//	element.normal = input[1].normal;	// �@�����R�s�[
//	element.uv = input[1].uv;				// UV���R�s�[
//	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//}

// �O�p�`�̏o�͂���A������3�o�͂���T���v��
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// �o�͗p���_�f�[�^ 
//
//	for (uint i = 0; i < 3; i++) {
//		// �����̎n�_
//		element.svpos = input[i].svpos;		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		element.uv = input[i].uv;				// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//
//		// �����̏I�_
//		if (i == 2) {
//			// +1����ƈ���̂ŁA�ŏ��ɖ߂�
//			element.svpos = input[0].svpos;		// ���_���W���R�s�[
//			element.normal = input[0].normal;	// �@�����R�s�[
//			element.uv = input[0].uv;				// UV���R�s�[
//		}
//		else {
//			element.svpos = input[i + 1].svpos;		// ���_���W���R�s�[
//			element.normal = input[i + 1].normal;	// �@�����R�s�[
//			element.uv = input[i + 1].uv;				// UV���R�s�[
//		}
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//		// ���݂̃X�g���b�v���I�����A���̃X�g���b�v���J�n
//		output.RestartStrip();
//	}
//}

// �O�p�`�̏o�͂���A������3�o�͂���T���v��
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;							// �o�͗p���_�f�[�^ 
//
//	// 3�p�`�̒��_����_������
//	for (uint i = 0; i < 3; i++) {
//		// �����̎n�_
//		element.svpos = input[i].svpos;		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		element.uv = input[i].uv;				// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//	}
//	// �ŏ��̓_��������x�ǉ�
//	element.svpos = input[0].svpos;		// ���_���W���R�s�[
//	element.normal = input[0].normal;	// �@�����R�s�[
//	element.uv = input[0].uv;				// UV���R�s�[
//	output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//}

// �O�p�`�̓��͂���A�O�p�`���o�͂��邪�A
// �r����UV�����H���ă^�C�����O
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// �o�͗p���_�f�[�^ 
//		element.svpos = input[i].svpos;		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		// UV��2�{��
//		element.uv = input[i].uv * 2.0f;		// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//	}
//}

// �O�p�`�̓��͂���A�O�p�`��2�o��
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// �_�X�g���[��
//	inout TriangleStream< GSOutput > output
//)
//{
//	// 1�ڂ̎O�p�`
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// �o�͗p���_�f�[�^ 
//		element.svpos = input[i].svpos;		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		element.uv = input[i].uv;				// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//	}
//	// ���݂̃X�g���b�v���I��
//	output.RestartStrip();
//
//	// 2�ڂ̎O�p�`
//	for (uint i = 0; i < 3; i++) {
//		GSOutput element;							// �o�͗p���_�f�[�^ 
//		// X������20���炷
//		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);		// ���_���W���R�s�[
//		element.normal = input[i].normal;	// �@�����R�s�[
//		// UV��5�{��
//		element.uv = input[i].uv * 5.0f;		// UV���R�s�[
//		output.Append(element);				// ���_���P�o��(�o�̓��X�g�ɒǉ�)
//	}
//}