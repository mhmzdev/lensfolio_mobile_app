part of '../add_project.dart';

class _FormData {
  static Map<String, dynamic> initialValues(Project? project) => {
    _FormKeys.title: project?.title ?? '',
    _FormKeys.description: project?.description ?? '',
    _FormKeys.technologies: project?.technologies ?? <String>[],
    _FormKeys.githubUrl: project?.githubUrl ?? '',
    _FormKeys.liveUrl: project?.liveUrl ?? '',
  };
}
