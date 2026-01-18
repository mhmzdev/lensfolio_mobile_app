part of 'cubit.dart';

@immutable
class UserState extends Equatable {
  // --- nested states --- //
  final BlocState<void> logout;
  final BlocState<UserData> udpate;
  final BlocState<UserData> fetch;
  final BlocState<UserData> init;
  final BlocState<UserData> register;
  final BlocState<UserData> login;

  // --- state data --- //
  final User? user;
  final UserData? userData;
  final AuthResponse? authResponse;

  const UserState({
    required this.logout,
    required this.udpate,
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
      logout = BlocState(),
      udpate = BlocState(),
      fetch = BlocState(),
      init = BlocState(),
      register = BlocState(),
      login = BlocState(),
      user = null,
      userData = null,
      authResponse = null;

  UserState copyWith({
    BlocState<void>? logout,
    BlocState<UserData>? udpate,
    BlocState<UserData>? fetch,
    BlocState<UserData>? init,
    BlocState<UserData>? register,
    BlocState<UserData>? login,
    User? user,
    UserData? userData,
    AuthResponse? authResponse,
  }) {
    return UserState(
      logout: logout ?? this.logout,
      udpate: udpate ?? this.udpate,
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
    logout,
    udpate,
    fetch,
    init,
    register,
    login,
    user,
    userData,
    authResponse,
  ];
}
