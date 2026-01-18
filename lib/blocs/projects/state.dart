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

  const ProjectsState({
    required this.delete,
    required this.update,
    required this.fetchAll,
    required this.fetchById,
    required this.create,
    this.projects,
  });

  ProjectsState.def()
    : // root-def-constructor
      delete = BlocState(),
      update = BlocState(),
      fetchAll = BlocState(),
      fetchById = BlocState(),
      create = BlocState(),
      projects = null;

  ProjectsState copyWith({
    BlocState<void>? delete,
    BlocState<Project>? update,
    BlocState<List<Project>>? fetchAll,
    BlocState<Project>? fetchById,
    BlocState<Project>? create,
    List<Project>? projects,
  }) {
    return ProjectsState(
      delete: delete ?? this.delete,
      update: update ?? this.update,
      fetchAll: fetchAll ?? this.fetchAll,
      fetchById: fetchById ?? this.fetchById,
      create: create ?? this.create,
      projects: projects ?? this.projects,
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
  ];
}
