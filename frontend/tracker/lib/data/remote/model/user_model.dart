import 'package:tracker/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String fullname;
  final String username;
  final String email;
  final bool isVerified;
  final String imageURL;
  final double balanceAmount;
  final double incomeAmount;
  final double expenseAmount;
  final String password;

  UserModel({
    required this.fullname,
    required this.username,
    required this.email,
    required this.isVerified,
    required this.imageURL,
    this.balanceAmount = 0,
    this.incomeAmount = 0,
    this.expenseAmount = 0,
    this.password = "",
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
      fullname: json["fullname"],
      username: json["username"],
      email: json["email"],
      isVerified: json["is_verified"],
      imageURL: json["image_url"],
      balanceAmount: json["balance"],
      incomeAmount: json["income"],
      expenseAmount: json["expense"],
    );
  }

  Map<String, dynamic> toJSON() => {
        "fullname": fullname,
        "username": username,
        "email": email,
        "isVerified": isVerified,
        "imageURL": imageURL,
        "balanceAmount": balanceAmount,
        "incomeAmount": incomeAmount,
        "expenseAmount": expenseAmount,
      };
}
