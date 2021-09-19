import 'package:tracker/data/error/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:tracker/data/local/datasource/local_expense_datasource.dart';
import 'package:tracker/data/remote/datasource/expense_datasource.dart';
import 'package:tracker/data/remote/model/expense_model.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/domain/repository/expense_repo.dart';

class ExpenseRepoImpl extends ExpenseRepo {
  final ExpenseDatasource remoteExpenseDatasource;
  final LocalExpenseDatasource localExpenseDatasource;

  ExpenseRepoImpl({
    required this.remoteExpenseDatasource,
    required this.localExpenseDatasource,
  });

  @override
  Future<Either<AppError, List<ExpenseEntity>>> getAllExpense() async {
    final eitherResponse = await remoteExpenseDatasource.getAllExpense();
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
        await remoteExpenseDatasource.getExpenseByCategory(category);
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
    final eitherResponse = await remoteExpenseDatasource.getRecentExpense();
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
  Future<Either<AppError, List<ExpenseEntity>>> addBudgetExpense(
    ExpenseEntity expense,
  ) async {
    ExpenseModel expenseModel = ExpenseModel(
      date: DateTime.now(),
      name: expense.name,
      price: expense.price,
      category: expense.category,
    );
    final eitherResponse = await remoteExpenseDatasource.addBudgetExpense(
      expenseModel,
    );
    return eitherResponse.fold(
      (err) => Left(err),
      (data) {
        List<ExpenseEntity> expenseData = data
            .map((e) => ExpenseEntity(
                  name: e.name,
                  category: e.category,
                  price: e.price,
                  date: e.date,
                ))
            .toList();
        return Right(expenseData);
      },
    );
  }
}
