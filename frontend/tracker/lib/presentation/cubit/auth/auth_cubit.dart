import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/user_entity.dart';
import 'package:tracker/domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;

  AuthCubit({required this.authUseCase}) : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    final Either<AppError, UserEntity> eitherResponse =
        await authUseCase.signIn(email, password);
    return eitherResponse.fold(
      (err) => emit(AuthFailed(message: err.message)),
      (data) => emit(AuthSuccess(user: data)),
    );
  }

  Future<void> googleSignIn() async {
    final Either<AppError, UserEntity> eitherResponse =
        await authUseCase.googleSignIn();
    return eitherResponse.fold(
      (err) => emit(AuthFailed(message: err.message)),
      (data) => emit(AuthSuccess(user: data)),
    );
  }

  void signUp() {}

  void forgotPassword() {}
}
