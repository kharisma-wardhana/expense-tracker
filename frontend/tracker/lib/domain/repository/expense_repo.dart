import 'package:dartz/dartz.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/domain/entity/expense_entity.dart';

abstract class ExpenseRepo {
  Future<Either<AppError, List<ExpenseEntity>>> getAllExpense();
}
