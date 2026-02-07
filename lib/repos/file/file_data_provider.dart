part of 'file_repo.dart';

class _FileProvider {
  static Future<String> uploadResume(File file, String uuid) async {
    try {
      final fullPath = await AppSupabase.supabase.storage
          .from(SupaBuckets.resumes)
          .upload('$uuid.pdf', file);
      return fullPath;
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<File> downloadResume(String filePath) async {
    try {
      /// FIXME: The object is not being found even though it exists in Storage.
      final file = await AppSupabase.supabase.storage
          .from(SupaBuckets.resumes)
          .download(filePath);
      return File.fromRawPath(file);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<String> uploadProfilePicture(File file, String uuid) async {
    try {
      final fileName = '$uuid.png';

      await AppSupabase.supabase.storage
          .from(SupaBuckets.profilePictures)
          .upload(fileName, file);

      final publicPath = AppSupabase.supabase.storage
          .from(SupaBuckets.profilePictures)
          .getPublicUrl(fileName);

      return publicPath;
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
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
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
