part of 'cubit.dart';

@immutable
class CoverLetterState extends Equatable {
  // --- nested states --- //
  final BlocState<List<CoverLetter>> fetch;
  final BlocState<CoverLetter> generate;
  final BlocState<CoverLetter> edit;
  final BlocState<void> delete;

  // --- state data --- //
  final List<CoverLetter> coverLetters;

  const CoverLetterState({
    required this.fetch,
    required this.generate,
    required this.edit,
    required this.delete,
    required this.coverLetters,
  });

  CoverLetterState.def()
    : // root-def-constructor
      fetch = BlocState(),
      generate = BlocState(),
      edit = BlocState(),
      delete = BlocState(),
      coverLetters = [];

  CoverLetterState copyWith({
    BlocState<List<CoverLetter>>? fetch,
    BlocState<CoverLetter>? generate,
    BlocState<CoverLetter>? edit,
    BlocState<void>? delete,
    List<CoverLetter>? coverLetters,
  }) {
    return CoverLetterState(
      fetch: fetch ?? this.fetch,
      generate: generate ?? this.generate,
      edit: edit ?? this.edit,
      delete: delete ?? this.delete,
      coverLetters: coverLetters ?? this.coverLetters,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    fetch,
    generate,
    edit,
    delete,
    coverLetters,
  ];
}
