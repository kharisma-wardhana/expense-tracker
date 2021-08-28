import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/user_entity.dart';

abstract class UserDatasource {
  Future<Either<AppError, UserEntity>> firebaseSignIn(
    String email,
    String password,
  );
  Future<Either<AppError, UserEntity>> googleSignIn();
}

class UserDatasourceImpl extends UserDatasource {
  @override
  Future<Either<AppError, UserEntity>> firebaseSignIn(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        UserEntity user = UserEntity(
          fullname: userCredential.user!.displayName ?? "fullname",
          username: userCredential.user!.displayName ?? "username",
          email: userCredential.user!.email ?? "email",
          balanceAmount: 0,
          incomeAmount: 0,
          expenseAmount: 0,
          isVerified: userCredential.user!.emailVerified,
        );
        return Right(user);
      }
      return Left(AppError(message: "User Not Found"));
    } on FirebaseAuthException catch (err) {
      return Left(AppError(message: err.message ?? "FirebaseAuth Exception"));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        UserEntity user = UserEntity(
          fullname: userCredential.user!.displayName!,
          username: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          balanceAmount: 0,
          incomeAmount: 0,
          expenseAmount: 0,
          isVerified: userCredential.user!.emailVerified,
        );
        return Right(user);
      }
      return Left(AppError(message: "User Not Found"));
    } on FirebaseAuthException catch (err) {
      return Left(AppError(message: err.message ?? "Google Exception"));
    }
  }
}
