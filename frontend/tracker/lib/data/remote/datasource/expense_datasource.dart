import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/data/remote/model/expense_model.dart';
import 'package:tracker/utils/dio_helper.dart';

abstract class ExpenseDatasource {
  Future<Either<AppError, List<ExpenseModel>>> getAllExpense();
  Future<Either<AppError, List<ExpenseModel>>> getExpenseByCategory(
    String category,
  );
  Future<Either<AppError, List<ExpenseModel>>> getRecentExpense();
}

class ExpenseDatasourceImpl extends ExpenseDatasource {
  final DioHelper client;
  String path =
      "${ApiConstant.baseURLNotion}/databases/${dotenv.env['NOTION_DATABASE_ID']}/query";

  ExpenseDatasourceImpl({required this.client});

  List<ExpenseModel> getListExpense(response) {
    return (response.data["results"] as List)
        .map((e) => ExpenseModel.fromJSON(e["properties"]))
        .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
  }

  @override
  Future<Either<AppError, List<ExpenseModel>>> getAllExpense() async {
    try {
      final response = await client.dio.post(path);
      if (response.statusCode == HttpStatus.ok) {
        return Right(getListExpense(response));
      }

      return Left(
        AppError(message: response.statusMessage ?? "Unexpected Error API"),
      );
    } catch (err) {
      return Left(
        AppError(message: "Unexpected Error"),
      );
    }
  }

  @override
  Future<Either<AppError, List<ExpenseModel>>> getExpenseByCategory(
    String category,
  ) async {
    try {
      Map<String, dynamic> filterData = {
        "filter": {
          "property": "Category",
          "select": {"equals": "$category"}
        }
      };
      final response = await client.dio.post(
        path,
        data: jsonEncode(filterData),
      );
      if (response.statusCode == HttpStatus.ok) {
        return Right(getListExpense(response));
      }

      return Left(
        AppError(message: response.statusMessage ?? "Unexpected Error API"),
      );
    } catch (err) {
      return Left(
        AppError(message: "Unexpected Error"),
      );
    }
  }

  @override
  Future<Either<AppError, List<ExpenseModel>>> getRecentExpense() async {
    try {
      Map<String, dynamic> pageSize = {"page_size": 5};
      final response = await client.dio.post(path, data: jsonEncode(pageSize));
      if (response.statusCode == HttpStatus.ok) {
        return Right(getListExpense(response));
      }

      return Left(
        AppError(message: response.statusMessage ?? "Unexpected Error API"),
      );
    } catch (err) {
      return Left(
        AppError(message: "Unexpected Error"),
      );
    }
  }
}
