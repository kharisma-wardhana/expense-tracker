import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/data/remote/model/user_model.dart';
import 'package:tracker/domain/entity/user_entity.dart';

abstract class UserDatasource {
  Future<Either<AppError, UserEntity>> firebaseSignIn(
    String email,
    String password,
  );
  Future<Either<AppError, UserEntity>> googleSignIn();
  Future<Either<AppError, UserEntity>> signUp(UserModel userData);
}

class UserDatasourceImpl extends UserDatasource {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  Future<DocumentSnapshot> getUserData(String? uid) async {
    return await userRef.doc(uid).get();
  }

  Future<void> saveUserData(String? uid, UserModel userModel) async {
    await userRef.doc(uid).set(userModel.toJSON());
  }

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
        DocumentSnapshot userData = await getUserData(userCredential.user?.uid);
        if (userData.exists) {
          Map<String, dynamic> jsonData =
              userData.data() as Map<String, dynamic>;
          UserEntity user = UserModel.fromJSON(jsonData);
          return Right(user);
        }
      }
      return Left(AppError(message: "User Not Found"));
    } on FirebaseAuthException catch (err) {
      return Left(AppError(message: err.message ?? "FirebaseAuth Exception"));
    } catch (err) {
      return Left(AppError(message: err.toString()));
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
        DocumentSnapshot userData = await getUserData(userCredential.user?.uid);
        if (userData.exists) {
          Map<String, dynamic> jsonData =
              userData.data() as Map<String, dynamic>;
          UserEntity user = UserModel.fromJSON(jsonData);
          return Right(user);
        } else {
          UserModel userModel = UserModel(
            fullname: userCredential.user?.displayName ?? "",
            username: userCredential.user?.displayName ?? "",
            email: userCredential.user?.email ?? "",
            isVerified: userCredential.user?.emailVerified ?? false,
            imageURL: userCredential.user?.photoURL ?? "",
          );
          await saveUserData(userCredential.user?.uid, userModel);
          return Right(userModel);
        }
      }
      return Left(AppError(message: "User Not Found"));
    } on FirebaseAuthException catch (err) {
      return Left(AppError(message: err.message ?? "Google Exception"));
    } catch (err) {
      return Left(AppError(message: err.toString()));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> signUp(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      if (userCredential.user != null) {
        userCredential.user?.sendEmailVerification();
        await saveUserData(userCredential.user?.uid, userModel);
        return Right(userModel);
      }
      return Left(AppError(message: "SignUp Exception"));
    } on FirebaseAuthException catch (err) {
      return Left(AppError(message: err.message ?? "SignUp Exception"));
    } catch (err) {
      return Left(AppError(message: err.toString()));
    }
  }
}
