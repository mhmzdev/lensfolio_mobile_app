import 'package:freezed_annotation/freezed_annotation.dart';

part '_creds.freezed.dart';
part '_creds.g.dart';

@freezed
sealed class SupabaseCreds with _$SupabaseCreds {
  const factory SupabaseCreds({
    required String url,
    @JsonKey(name: 'anon_key') required String anonKey,
  }) = _SupabaseCreds;

  factory SupabaseCreds.fromJson(Map<String, Object?> json) =>
      _$SupabaseCredsFromJson(json);
}
