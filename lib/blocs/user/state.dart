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
  final UserData? userData;

  const UserState({
    required this.logout,
    required this.udpate,
    required this.fetch,
    required this.init,
    required this.register,
    required this.login,
    this.userData,
  });

  UserState.def()
    : // root-def-constructor
      logout = BlocState(),
      udpate = BlocState(),
      fetch = BlocState(),
      init = BlocState(),
      register = BlocState(),
      login = BlocState(),
      userData = null;

  UserState copyWith({
    BlocState<void>? logout,
    BlocState<UserData>? udpate,
    BlocState<UserData>? fetch,
    BlocState<UserData>? init,
    BlocState<UserData>? register,
    BlocState<UserData>? login,
    UserData? userData,
  }) {
    return UserState(
      logout: logout ?? this.logout,
      udpate: udpate ?? this.udpate,
      fetch: fetch ?? this.fetch,
      init: init ?? this.init,
      register: register ?? this.register,
      login: login ?? this.login,
      userData: userData ?? this.userData,
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
    userData,
  ];
}
