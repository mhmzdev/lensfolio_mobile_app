part of 'cubit.dart';

@immutable
class UserState extends Equatable {
  // --- nested states --- //
  final BlocState<GeneratedProfile> generateProfile;
  final BlocState<void> logout;
  final BlocState<UserData> update;
  final BlocState<UserData> fetch;
  final BlocState<UserData> init;
  final BlocState<void> register;
  final BlocState<UserData> login;

  // --- state data --- //
  final User? user;
  final UserData? userData;
  final AuthResponse? authResponse;

  const UserState({
    required this.generateProfile,
    required this.logout,
    required this.update,
    required this.fetch,
    required this.init,
    required this.register,
    required this.login,
    this.user,
    this.userData,
    this.authResponse,
  });

  UserState.def()
    : // root-def-constructor
      generateProfile = BlocState(),
      logout = BlocState(),
      update = BlocState(),
      fetch = BlocState(),
      init = BlocState(),
      register = BlocState(),
      login = BlocState(),
      user = null,
      userData = null,
      authResponse = null;

  UserState copyWith({
    BlocState<GeneratedProfile>? generateProfile,
    BlocState<void>? logout,
    BlocState<UserData>? update,
    BlocState<UserData>? fetch,
    BlocState<UserData>? init,
    BlocState<void>? register,
    BlocState<UserData>? login,
    User? user,
    UserData? userData,
    AuthResponse? authResponse,
  }) {
    return UserState(
      generateProfile: generateProfile ?? this.generateProfile,
      logout: logout ?? this.logout,
      update: update ?? this.update,
      fetch: fetch ?? this.fetch,
      init: init ?? this.init,
      register: register ?? this.register,
      login: login ?? this.login,
      user: user ?? this.user,
      userData: userData ?? this.userData,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    generateProfile,
    logout,
    update,
    fetch,
    init,
    register,
    login,
    user,
    userData,
    authResponse,
  ];
}
