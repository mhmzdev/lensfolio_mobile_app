part of 'projects_repo.dart';

class _ProjectsProvider {
  /// Deletes a project by ID from the database.
  /// Also cleans up the cover image from storage if provided.
  static Future<void> delete(int id, {String? imageUrl}) async {
    try {
      // Delete cover image from storage if exists
      if (imageUrl != null && imageUrl.isNotEmpty) {
        await _tryDeleteCoverImage(imageUrl);
      }

      await AppSupabase.supabase
          .from(SupaTables.projects)
          .delete()
          .eq('id', id);
    } catch (e, st) {
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  /// Attempts to delete a cover image from storage.
  /// Fails silently to not block the main operation.
  static Future<void> _tryDeleteCoverImage(String imageUrl) async {
    try {
      final uri = Uri.parse(imageUrl);
      final fileName = uri.pathSegments.last;

      await AppSupabase.supabase.storage
          .from(SupaBuckets.projectCovers)
          .remove([fileName]);
    } catch (_) {
      // Fail silently - cleanup failure shouldn't block deletion
    }
  }

  /// Updates a project with the given values.
  /// Optionally uploads a new cover image or removes the existing one.
  static Future<Project> update(
    int id,
    Map<String, dynamic> values, {
    File? coverImage,
    bool removeExistingImage = false,
  }) async {
    try {
      // Handle cover image scenarios:
      // 1. New image provided -> upload (upsert handles replacement)
      // 2. Remove existing image -> set to null
      // 3. No changes -> keep existing (don't include in payload)
      if (coverImage != null) {
        final imageUrl = await _uploadCoverImage(coverImage, values['title']);
        values['image_url'] = imageUrl;
      } else if (removeExistingImage) {
        values['image_url'] = null;
      }

      final updatedProject = await AppSupabase.supabase
          .from(SupaTables.projects)
          .update(values)
          .eq('id', id)
          .select()
          .single();

      return Project.fromJson(updatedProject);
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  /// Fetches all projects for a given user ID.
  static Future<List<Project>> fetchAll(int uid) async {
    try {
      final projects = await AppSupabase.supabase
          .from(SupaTables.projects)
          .select('*')
          .eq('uid', uid)
          .order('created_at', ascending: false);

      return (projects as List)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  /// Fetches a single project by its ID.
  static Future<Project> fetchById(int id) async {
    try {
      final project = await AppSupabase.supabase
          .from(SupaTables.projects)
          .select('*')
          .eq('id', id)
          .single();

      return Project.fromJson(project);
    } catch (e, st) {
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  /// Creates a new project. Optionally uploads a cover image first.
  static Future<Project> create(
    int uid,
    Map<String, dynamic> data, {
    File? coverImage,
  }) async {
    try {
      String? imageUrl;

      if (coverImage != null) {
        imageUrl = await _uploadCoverImage(coverImage, data['title']);
      }

      final payload = {
        ...data,
        'uid': uid,
        'image_url': imageUrl,
        'created_at': DateTime.now().toIso8601String(),
      };

      final createdProject = await AppSupabase.supabase
          .from(SupaTables.projects)
          .insert(payload)
          .select()
          .single();

      return Project.fromJson(createdProject);
    } catch (e, st) {
      if (e is StorageException) {
        throw SupaStorageFault.fromStorageException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  /// Uploads a cover image to storage and returns the public URL.
  static Future<String> _uploadCoverImage(
    File file,
    String projectTitle,
  ) async {
    final fileName = '${projectTitle.snakeCase}.png';

    await AppSupabase.supabase.storage
        .from(SupaBuckets.projectCovers)
        .upload(
          fileName,
          file,
          fileOptions: const FileOptions(
            upsert: true,
            cacheControl: '3600',
          ),
        );

    final publicUrl = AppSupabase.supabase.storage
        .from(SupaBuckets.projectCovers)
        .getPublicUrl(fileName);

    return publicUrl;
  }
}
