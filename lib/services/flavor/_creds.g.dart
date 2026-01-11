// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_creds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupabaseCreds _$SupabaseCredsFromJson(Map<String, dynamic> json) =>
    _SupabaseCreds(
      url: json['url'] as String,
      anonKey: json['anon_key'] as String,
    );

Map<String, dynamic> _$SupabaseCredsToJson(_SupabaseCreds instance) =>
    <String, dynamic>{'url': instance.url, 'anon_key': instance.anonKey};
