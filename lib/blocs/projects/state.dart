part of 'cubit.dart';

@immutable
class ProjectsState extends Equatable {
  // --- nested states --- //
  final BlocState<void> delete;
  final BlocState<Project> update;
  final BlocState<List<Project>> fetchAll;
  final BlocState<Project> fetchById;
  final BlocState<Project> create;

  // --- state data --- //
  final List<Project>? projects;
  final int uid;

  const ProjectsState({
    required this.delete,
    required this.update,
    required this.fetchAll,
    required this.fetchById,
    required this.create,
    this.projects,
    required this.uid,
  });

  ProjectsState.def()
    : // root-def-constructor
      delete = BlocState(),
      update = BlocState(),
      fetchAll = BlocState(),
      fetchById = BlocState(),
      create = BlocState(),
      projects = null,
      uid = 0;

  ProjectsState copyWith({
    BlocState<void>? delete,
    BlocState<Project>? update,
    BlocState<List<Project>>? fetchAll,
    BlocState<Project>? fetchById,
    BlocState<Project>? create,
    List<Project>? projects,
    int? uid,
  }) {
    return ProjectsState(
      delete: delete ?? this.delete,
      update: update ?? this.update,
      fetchAll: fetchAll ?? this.fetchAll,
      fetchById: fetchById ?? this.fetchById,
      create: create ?? this.create,
      projects: projects ?? this.projects,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    delete,
    update,
    fetchAll,
    fetchById,
    create,
    projects,
    uid,
  ];
}
