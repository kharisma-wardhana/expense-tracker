import 'package:dartz/dartz.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/user_entity.dart';

abstract class UserRepo {
  Future<Either<AppError, UserEntity>> signIn(
    String email,
    String password,
  );
  Future<Either<AppError, UserEntity>> googleSignIn();
}
