part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess({required this.user});
}

class AuthFailed extends AuthState {
  final String message;
  const AuthFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
