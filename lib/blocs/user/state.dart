part of 'cubit.dart';

@immutable
class UserState extends Equatable {
  // --- nested states --- //
  final BlocState<UserData> register;
  final BlocState<UserData> login;

  // --- state data --- //

  const UserState({
    required this.register,

    required this.login,
  });

  UserState.def()
    : // root-def-constructor
      register = BlocState(),

      login = BlocState();

  UserState copyWith({
    BlocState<UserData>? register,

    BlocState<UserData>? login,
  }) {
    return UserState(
      register: register ?? this.register,

      login: login ?? this.login,
    );
  }

  @override
  List<Object?> get props => [
    // root-state-props
    register,
    login,
  ];
}
