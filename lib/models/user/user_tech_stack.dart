import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tech_stack.freezed.dart';
part 'user_tech_stack.g.dart';

@freezed
sealed class UserTechStack with _$UserTechStack {
  const factory UserTechStack({
    required TechStack category,
    required List<String> technologies,
  }) = _UserTechStack;

  factory UserTechStack.fromJson(Map<String, Object?> json) =>
      _$UserTechStackFromJson(json);
}

extension TechStackX on TechStack {
  bool get isFrontend => this == TechStack.frontend;
  bool get isBackend => this == TechStack.backend;
  bool get isDatabase => this == TechStack.database;
  bool get isDevops => this == TechStack.devops;
  bool get isDesign => this == TechStack.design;
  bool get isOther => this == TechStack.other;
}

enum TechStack {
  frontend,
  backend,
  database,
  devops,
  design,
  other,
}
