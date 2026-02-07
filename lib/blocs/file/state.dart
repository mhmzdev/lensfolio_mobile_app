part of 'cubit.dart';

@immutable
class FileState extends Equatable {
  // --- nested states --- //
  final BlocState<String> uploadResume;
  final BlocState<File> downloadResume;
  final BlocState<String> uploadProfilePicture;
  final BlocState<void> deleteFile;

  // --- state data --- //
  final String? uuid;

  const FileState({
    required this.uploadResume,
    required this.downloadResume,
    required this.uploadProfilePicture,
    required this.deleteFile,
    this.uuid,
  });

  FileState.def()
    : // root-def-constructor
      uploadResume = BlocState(),
      downloadResume = BlocState(),
      uploadProfilePicture = BlocState(),
      deleteFile = BlocState(),
      uuid = null;

  FileState copyWith({
    BlocState<String>? uploadResume,
    BlocState<File>? downloadResume,
    BlocState<String>? uploadProfilePicture,
    BlocState<void>? deleteFile,
    String? uuid,
  }) {
    return FileState(
      uploadResume: uploadResume ?? this.uploadResume,
      downloadResume: downloadResume ?? this.downloadResume,
      uploadProfilePicture: uploadProfilePicture ?? this.uploadProfilePicture,
      deleteFile: deleteFile ?? this.deleteFile,
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    uploadResume,
    downloadResume,
    uploadProfilePicture,
    deleteFile,
    uuid,
  ];
}
