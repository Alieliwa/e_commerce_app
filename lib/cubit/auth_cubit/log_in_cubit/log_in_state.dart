part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LogInLoading extends LogInState {}
final class LogInSucsses extends LogInState {
  UserModel? userModel;
  LogInSucsses(this.userModel);
}
final class LogInError extends LogInState {
  String? error;
  LogInError(this.error);
}

final class ChangePasswordVisibilityStates extends LogInState{}