// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive/hive.dart';
import 'package:tracker/domain/entity/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel extends UserEntity {
  @HiveField(0)
  final String fullname;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final bool isVerified;

  @HiveField(4)
  final String imageURL;

  @HiveField(5)
  final double balanceAmount;

  @HiveField(6)
  final double incomeAmount;

  @HiveField(7)
  final double expenseAmount;

  @HiveField(8)
  final String password;

  const UserModel({
    required this.fullname,
    required this.username,
    required this.email,
    required this.isVerified,
    required this.imageURL,
    this.balanceAmount = 0,
    this.incomeAmount = 0,
    this.expenseAmount = 0,
    this.password = '',
  }) : super(
          fullname: fullname,
          username: username,
          email: email,
          isVerified: isVerified,
          imageURL: imageURL,
          balanceAmount: balanceAmount,
          incomeAmount: incomeAmount,
          expenseAmount: expenseAmount,
          password: password,
        );

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      fullname: json['fullname'],
      username: json['username'],
      email: json['email'],
      isVerified: json['is_verified'],
      imageURL: json['image_url'],
      balanceAmount: json['balance'],
      incomeAmount: json['income'],
      expenseAmount: json['expense'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'fullname': fullname,
        'username': username,
        'email': email,
        'isVerified': isVerified,
        'imageURL': imageURL,
        'balanceAmount': balanceAmount,
        'incomeAmount': incomeAmount,
        'expenseAmount': expenseAmount,
      };
}
