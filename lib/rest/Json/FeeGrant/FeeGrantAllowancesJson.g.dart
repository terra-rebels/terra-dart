// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeeGrantAllowancesJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeGrantAllowancesJson _$FeeGrantAllowancesJsonFromJson(
        Map<String, dynamic> json) =>
    FeeGrantAllowancesJson(
      json['granter'] as String,
      json['grantee'] as String,
      CommonTypeValueArgs.fromJson(json['allowance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeeGrantAllowancesJsonToJson(
        FeeGrantAllowancesJson instance) =>
    <String, dynamic>{
      'granter': instance.granter,
      'grantee': instance.grantee,
      'allowance': instance.allowance,
    };
