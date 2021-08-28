import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String fullname;
  final String username;
  final String email;
  final String password;
  final bool isVerified;
  final double balanceAmount;
  final double incomeAmount;
  final double expenseAmount;

  UserEntity({
    required this.fullname,
    required this.username,
    required this.email,
    this.password = "",
    required this.isVerified,
    required this.balanceAmount,
    required this.incomeAmount,
    required this.expenseAmount,
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
      ];
}
