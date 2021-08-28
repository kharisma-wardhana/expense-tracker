import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/data/error/app_error.dart';
import 'package:tracker/data/remote/model/expense_model.dart';
import 'package:tracker/utils/dio_helper.dart';

abstract class ExpenseDatasource {
  Future<Either<AppError, List<ExpenseModel>>> getAllExpense();
}

class ExpenseDatasourceImpl extends ExpenseDatasource {
  final DioHelper client;

  ExpenseDatasourceImpl({required this.client});

  @override
  Future<Either<AppError, List<ExpenseModel>>> getAllExpense() async {
    try {
      final path =
          "${ApiConstant.baseURLNotion}/databases/${dotenv.env['NOTION_DATABASE_ID']}/query";
      final response = await client.dio.post(path);

      if (response.statusCode == HttpStatus.ok) {
        List<ExpenseModel> listExpenseModel = (response.data["results"] as List)
            .map((e) => ExpenseModel.fromJSON(e["properties"]))
            .toList()
              ..sort((a, b) => b.date.compareTo(a.date));

        return Right(listExpenseModel);
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
