import 'package:dartz/dartz.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/data/remote/datasource/user_datasource.dart';
import 'package:tracker/data/remote/model/user_model.dart';
import 'package:tracker/domain/entity/user_entity.dart';
import 'package:tracker/domain/repository/user_repo.dart';

class UserRepoImpl extends UserRepo {
  UserDatasource userDatasource;
  UserRepoImpl({required this.userDatasource});

  @override
  Future<Either<AppError, UserEntity>> signIn(
    String email,
    String password,
  ) async {
    final Either<AppError, UserEntity> eitherResponse =
        await userDatasource.firebaseSignIn(email, password);
    return eitherResponse.fold(
      (err) => Left(err),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<AppError, UserEntity>> googleSignIn() async {
    final Either<AppError, UserEntity> eitherResponse =
        await userDatasource.googleSignIn();
    return eitherResponse.fold(
      (err) => Left(err),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<AppError, UserEntity>> signUp(UserEntity userData) async {
    UserModel userModel = UserModel(
      fullname: userData.fullname,
      username: userData.username,
      email: userData.email,
      isVerified: userData.isVerified,
      imageURL: userData.imageURL,
      password: userData.password,
    );
    final Either<AppError, UserEntity> eitherResponse =
        await userDatasource.signUp(userModel);
    return eitherResponse.fold(
      (err) => Left(err),
      (data) => Right(data),
    );
  }
}
