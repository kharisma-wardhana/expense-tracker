import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String fullname;
  final String username;
  final String email;
  final bool isVerified;
  final String imageURL;
  final double balanceAmount;
  final double incomeAmount;
  final double expenseAmount;
  final String password;

  const UserEntity({
    required this.fullname,
    required this.username,
    required this.email,
    required this.isVerified,
    required this.imageURL,
    this.balanceAmount = 0,
    this.incomeAmount = 0,
    this.expenseAmount = 0,
    required this.password,
  });

  @override
  List<Object?> get props => [
        fullname,
        username,
        email,
        isVerified,
        balanceAmount,
        incomeAmount,
        expenseAmount,
        password,
      ];
}
