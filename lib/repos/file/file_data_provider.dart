part of 'file_repo.dart';

class _FileProvider {
  static Future<String> uploadResume(File file, String uuid) async {
    try {
      final fullPath = await AppSupabase.supabase.storage
          .from(SupaBuckets.resumes)
          .update(
            '$uuid.pdf',
            file,
            fileOptions: const FileOptions(upsert: true),
          );

      /// We only want the uuid.pdf to be path, so that in case we changed
      /// our bucket on day we don't want 'resumes' hardcoded in the path.
      final cleanPath = fullPath.split('/').last;
      return cleanPath;
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<File> downloadResume(String filePath) async {
    try {
      final bytes = await AppSupabase.supabase.storage
          .from(SupaBuckets.resumes)
          .download(filePath);

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filePath');

      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes);

      return file;
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<String> uploadProfilePicture(File file, String uuid) async {
    try {
      final fileName = '$uuid.png';

      await AppSupabase.supabase.storage
          .from(SupaBuckets.profilePictures)
          .update(
            fileName,
            file,
            fileOptions: const FileOptions(
              upsert: true,
              cacheControl: '300',
            ),
          );

      final publicPath = AppSupabase.supabase.storage
          .from(SupaBuckets.profilePictures)
          .getPublicUrl(fileName);

      return publicPath;
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<void> deleteFile(
    String filePath, {
    required String bucket,
  }) async {
    try {
      await AppSupabase.supabase.storage.from(bucket).remove([filePath]);
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
