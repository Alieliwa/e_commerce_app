part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSucsses extends SignUpState {
  String? message;
  bool? status;
  SignUpSucsses(this.message,this.status);
}
final class SignUpError extends SignUpState {
  String? error;
  SignUpError(this.error);
}
