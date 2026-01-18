import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
sealed class Project with _$Project {
  const factory Project({
    required int id,
    required int uid,
    required String title,
    required String description,
    required List<String> technologies,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'live_url') String? liveUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
