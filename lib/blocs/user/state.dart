part of 'cubit.dart';

@immutable
class UserState extends Equatable {
  // --- nested states --- //
  final BlocState<UserData> register;
  final BlocState<UserData> logout;
  final BlocState<UserData> fetch;
  final BlocState<UserData> login;

  // --- state data --- //

  const UserState({
    required this.register,
    required this.logout,

    required this.fetch,
    required this.login,
  });

  UserState.def()
    : // root-def-constructor
      register = BlocState(),
      logout = BlocState(),

      fetch = BlocState(),
      login = BlocState();

  UserState copyWith({
    BlocState<UserData>? register,
    BlocState<UserData>? logout,

    BlocState<UserData>? fetch,
    BlocState<UserData>? login,
  }) {
    return UserState(
      register: register ?? this.register,

      logout: logout ?? this.logout,

      fetch: fetch ?? this.fetch,
      login: login ?? this.login,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    register, logout,
    fetch,
    login,
  ];
}
