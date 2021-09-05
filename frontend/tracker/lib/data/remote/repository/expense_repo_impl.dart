import 'package:tracker/data/error/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:tracker/data/remote/datasource/expense_datasource.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/domain/repository/expense_repo.dart';

class ExpenseRepoImpl extends ExpenseRepo {
  final ExpenseDatasource expenseDatasource;

  ExpenseRepoImpl({required this.expenseDatasource});

  @override
  Future<Either<AppError, List<ExpenseEntity>>> getAllExpense() async {
    final eitherResponse = await expenseDatasource.getAllExpense();
    return eitherResponse.fold(
      (err) => Left(err),
      (data) {
        List<ExpenseEntity> expense = data
            .map((e) => ExpenseEntity(
                  name: e.name,
                  category: e.category,
                  price: e.price,
                  date: e.date,
                ))
            .toList();
        return Right(expense);
      },
    );
  }

  @override
  Future<Either<AppError, List<ExpenseEntity>>> getCategoryExpense(
    String category,
  ) async {
    final eitherResponse =
        await expenseDatasource.getExpenseByCategory(category);
    return eitherResponse.fold(
      (err) => Left(err),
      (data) {
        List<ExpenseEntity> expense = data
            .map((e) => ExpenseEntity(
                  name: e.name,
                  category: e.category,
                  price: e.price,
                  date: e.date,
                ))
            .toList();
        return Right(expense);
      },
    );
  }

  @override
  Future<Either<AppError, List<ExpenseEntity>>> getRecentExpense() async {
    final eitherResponse = await expenseDatasource.getRecentExpense();
    return eitherResponse.fold(
      (err) => Left(err),
      (data) {
        List<ExpenseEntity> expense = data
            .map((e) => ExpenseEntity(
                  name: e.name,
                  category: e.category,
                  price: e.price,
                  date: e.date,
                ))
            .toList();
        return Right(expense);
      },
    );
  }
}
