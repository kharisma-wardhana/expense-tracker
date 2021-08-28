part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess({required this.user});
}

class AuthFailed extends AuthState {
  final String message;
  AuthFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
