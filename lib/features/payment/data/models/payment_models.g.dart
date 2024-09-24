// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      id: (json['id'] as num).toInt(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
    };

_$PaymentKeyResponseImpl _$$PaymentKeyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentKeyResponseImpl(
      token: json['token'] as String,
    );

Map<String, dynamic> _$$PaymentKeyResponseImplToJson(
        _$PaymentKeyResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
