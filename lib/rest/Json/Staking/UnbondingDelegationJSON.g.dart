// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnbondingDelegationJSON.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnbondingDelegationJSON _$UnbondingDelegationJSONFromJson(
        Map<String, dynamic> json) =>
    UnbondingDelegationJSON(
      UnbondingDelegationDataJSON.fromJson(
          json['unbond'] as Map<String, dynamic>),
      (json['unbonding_responses'] as List<dynamic>)
          .map((e) =>
              UnbondingDelegationDataJSON.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnbondingDelegationJSONToJson(
        UnbondingDelegationJSON instance) =>
    <String, dynamic>{
      'unbond': instance.unbond,
      'unbonding_responses': instance.unbonding_responses,
    };
