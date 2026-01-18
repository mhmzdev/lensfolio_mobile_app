part of 'user_repo.dart';

class _UserProvider {
  static Future<UserData> udpate(Map<String, dynamic> values) async {
    try {
      final userId = values['id'] as int;
      final updatedUser = await AppSupabase.supabase
          .from(SupaTables.users)
          .update(values)
          .eq('id', userId)
          .select()
          .single();

      final raw = updatedUser['data'] as Map<String, dynamic>;
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<UserData> fetch(String email) async {
    try {
      final user = await AppSupabase.supabase
          .from(SupaTables.users)
          .select('*')
          .eq('email', email)
          .single();
      return UserData.fromJson(user);
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<AuthResponse> register(Map<String, dynamic> values) async {
    try {
      final authResponse = await AppSupabase.supabase.auth.signUp(
        email: values['email'],
        password: values['password'],
      );
      return authResponse;
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<AuthResponse> login(Map<String, dynamic> values) async {
    try {
      final authResponse = await AppSupabase.supabase.auth.signInWithPassword(
        email: values['email'],
        password: values['password'],
      );

      return authResponse;
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
