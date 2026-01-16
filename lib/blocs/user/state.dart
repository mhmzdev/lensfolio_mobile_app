part of 'cubit.dart';

@immutable
class UserState extends Equatable {
  // --- nested states --- //
  final BlocState<UserData> fetch;
  final BlocState<UserData> init;
  final BlocState<UserData> register;
  final BlocState<UserData> login;

  // --- state data --- //
  final UserData? userData;

  const UserState({
    required this.fetch,

    required this.init,
    required this.register,
    required this.login,
    this.userData,
  });

  UserState.def()
    : // root-def-constructor
      fetch = BlocState(),

      init = BlocState(),
      register = BlocState(),
      login = BlocState(),
      userData = null;

  UserState copyWith({
    BlocState<UserData>? fetch,

    BlocState<UserData>? init,
    BlocState<UserData>? register,
    BlocState<UserData>? login,
    UserData? userData,
  }) {
    return UserState(
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
    fetch,
    init,
    register,
    login,
    userData,
  ];
}
