part of 'add_project.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  _ScreenState({this.project});

  final Project? project;

  final formKey = GlobalKey<FormBuilderState>();

  File? _coverImage;
  File? get coverImage => _coverImage;

  bool _pickingImage = false;
  bool get pickingImage => _pickingImage;

  /// Tracks if the existing network image was removed in edit mode.
  bool _existingImageRemoved = false;
  bool get existingImageRemoved => _existingImageRemoved;

  /// Whether we're in edit mode (updating an existing project).
  bool get isEditMode => project != null;

  /// The existing network image URL from the project (if editing).
  String? get existingImageUrl => project?.imageUrl;

  /// Whether to show the existing network image.
  bool get showExistingImage =>
      isEditMode &&
      existingImageUrl != null &&
      existingImageUrl!.isNotEmpty &&
      !_existingImageRemoved &&
      _coverImage == null;

  /// Picks a cover image from the gallery.
  void pickCoverImage(BuildContext context) async {
    _pickingImage = true;
    notifyListeners();
    try {
      final imagePicker = ImagePicker();
      final result = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1920,
        maxHeight: 1080,
      );
      if (result != null && context.mounted) {
        _coverImage = File(result.path);
        _existingImageRemoved = false;
      }
    } catch (e) {
      e.appLog(level: .error);
      if (!context.mounted) return;
      UIFlash.error(context, 'Failed to pick cover image.');
    } finally {
      _pickingImage = false;
      notifyListeners();
    }
  }

  /// Removes the selected cover image.
  void removeCoverImage() {
    if (_coverImage != null) {
      _coverImage = null;
    } else if (existingImageUrl != null) {
      _existingImageRemoved = true;
    }
    notifyListeners();
  }

  /// Validates and submits the form to create or update a project.
  void onSubmit(BuildContext context) {
    try {
      final form = formKey.currentState!;
      final isValid = form.saveAndValidate();
      if (!isValid) return;

      context.dismissKeyboard();

      final userCubit = UserCubit.c(context);
      final userId = userCubit.state.userData!.id;

      final formData = form.value;
      final payload = {
        _FormKeys.title: formData[_FormKeys.title],
        _FormKeys.description: formData[_FormKeys.description],
        _FormKeys.technologies: formData[_FormKeys.technologies] ?? <String>[],
        _FormKeys.githubUrl: _sanitizeUrl(formData[_FormKeys.githubUrl]),
        _FormKeys.liveUrl: _sanitizeUrl(formData[_FormKeys.liveUrl]),
      };

      if (isEditMode) {
        _handleUpdate(context, payload);
      } else {
        _handleCreate(context, userId, payload);
      }
    } catch (e) {
      e.appLog(level: .error);
      UIFlash.error(context, 'Something went wrong during form submission.');
    }
  }

  /// Handles creating a new project.
  void _handleCreate(
    BuildContext context,
    int userId,
    Map<String, dynamic> payload,
  ) {
    ProjectsCubit.c(context).create(
      userId,
      payload,
      coverImage: _coverImage,
    );
  }

  /// Handles updating an existing project.
  void _handleUpdate(BuildContext context, Map<String, dynamic> payload) {
    ProjectsCubit.c(context).update(
      project!.id,
      payload,
      coverImage: _coverImage,
      removeExistingImage: _existingImageRemoved,
    );
  }

  /// Sanitizes URL fields - returns null if empty.
  String? _sanitizeUrl(String? url) {
    if (url == null || url.trim().isEmpty) return null;
    return url.trim();
  }
}
