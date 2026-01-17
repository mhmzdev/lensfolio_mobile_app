part of 'cubit.dart';

@immutable
class JobsState extends Equatable {
  // --- nested states --- //
  final BlocState<JobFetchRespnose> fetch;

  // --- state data --- //
  final JobFetchRespnose? jobs;

  const JobsState({
    required this.fetch,
    this.jobs,
  });

  JobsState.def()
    : // root-def-constructor
      fetch = BlocState(),
      jobs = null;

  JobsState copyWith({
    BlocState<JobFetchRespnose>? fetch,
    JobFetchRespnose? jobs,
  }) {
    return JobsState(
      fetch: fetch ?? this.fetch,
      jobs: jobs ?? this.jobs,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    fetch,
    jobs,
  ];
}
