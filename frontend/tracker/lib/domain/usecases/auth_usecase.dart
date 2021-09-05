import 'package:dartz/dartz.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/user_entity.dart';
import 'package:tracker/domain/repository/user_repo.dart';

abstract class AuthUseCase {
  Future<Either<AppError, UserEntity>> signIn(String email, String password);
  Future<Either<AppError, UserEntity>> googleSignIn();
  Future<Either<AppError, UserEntity>> signUp(UserEntity userData);
}

class AuthUseCaseImpl extends AuthUseCase {
  UserRepo userRepo;

  AuthUseCaseImpl({required this.userRepo});

  @override
  Future<Either<AppError, UserEntity>> signIn(
    String email,
    String password,
  ) async =>
      await userRepo.signIn(email, password);

  @override
  Future<Either<AppError, UserEntity>> googleSignIn() async =>
      await userRepo.googleSignIn();

  @override
  Future<Either<AppError, UserEntity>> signUp(UserEntity userData) async =>
      await userRepo.signUp(userData);
}
