part of 'cubit.dart';

@immutable
class CoverLetterState extends Equatable {
  // --- nested states --- //
  final BlocState<CoverLetter> save;
  final BlocState<List<CoverLetter>> fetch;
  final BlocState<LetterPromptResponse> generate;
  final BlocState<CoverLetter> edit;
  final BlocState<void> delete;

  // --- state data --- //
  final List<CoverLetter> coverLetters;
  final int uid;

  const CoverLetterState({
    required this.save,
    required this.fetch,
    required this.generate,
    required this.edit,
    required this.delete,
    required this.coverLetters,
    required this.uid,
  });

  CoverLetterState.def()
    : // root-def-constructor
      save = BlocState(),
      fetch = BlocState(),
      generate = BlocState(),
      edit = BlocState(),
      delete = BlocState(),
      coverLetters = [],
      uid = 0;

  CoverLetterState copyWith({
    BlocState<CoverLetter>? save,
    BlocState<List<CoverLetter>>? fetch,
    BlocState<LetterPromptResponse>? generate,
    BlocState<CoverLetter>? edit,
    BlocState<void>? delete,
    List<CoverLetter>? coverLetters,
    int? uid,
  }) {
    return CoverLetterState(
      save: save ?? this.save,
      fetch: fetch ?? this.fetch,
      generate: generate ?? this.generate,
      edit: edit ?? this.edit,
      delete: delete ?? this.delete,
      coverLetters: coverLetters ?? this.coverLetters,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    save,
    fetch,
    generate,
    edit,
    delete,
    coverLetters,
    uid,
  ];
}
