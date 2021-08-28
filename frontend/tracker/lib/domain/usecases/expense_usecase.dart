import 'package:dartz/dartz.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/domain/repository/expense_repo.dart';

abstract class ExpenseUseCase {
  Future<Either<AppError, List<ExpenseEntity>>> getAllExpense();
}

class ExpenseUseCaseImpl extends ExpenseUseCase {
  final ExpenseRepo expenseRepo;

  ExpenseUseCaseImpl({required this.expenseRepo});

  Future<Either<AppError, List<ExpenseEntity>>> getAllExpense() async {
    return await expenseRepo.getAllExpense();
  }
}
