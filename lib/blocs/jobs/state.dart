part of 'cubit.dart';

@immutable
class JobsState extends Equatable {
  // --- nested states --- //
  final BlocState<Job> fetch;

  // --- state data --- //

  const JobsState({
    required this.fetch,
  });

  JobsState.def()
    : // root-def-constructor
      fetch = BlocState();

  JobsState copyWith({
    BlocState<Job>? fetch,
  }) {
    return JobsState(
      fetch: fetch ?? this.fetch,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    fetch,
  ];
}
