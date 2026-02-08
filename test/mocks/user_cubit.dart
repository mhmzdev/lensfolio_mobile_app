import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';

/// A mock UserCubit for testing that allows setting initial state
class MockUserCubit extends UserCubit {
  MockUserCubit._(UserState initialState) : super() {
    emit(initialState);
  }

  /// Creates a mock cubit with a logged-in user
  factory MockUserCubit.loggedIn(UserData userData) {
    final state = UserState.def().copyWith(
      userData: userData,
      fetch: BlocState<UserData>().toSuccess(data: userData),
      init: BlocState<UserData>().toSuccess(data: userData),
    );
    return MockUserCubit._(state);
  }

  /// Creates a mock cubit in loading state
  factory MockUserCubit.loading() {
    final state = UserState.def().copyWith(
      fetch: BlocState<UserData>().toLoading(),
    );
    return MockUserCubit._(state);
  }

  /// Creates a mock cubit with no user (logged out)
  factory MockUserCubit.loggedOut() {
    return MockUserCubit._(UserState.def());
  }

  /// Creates a mock cubit with custom state
  factory MockUserCubit.withState(UserState state) {
    return MockUserCubit._(state);
  }

  /// Emits a new state for testing
  void emitState(UserState state) {
    emit(state);
  }
}
