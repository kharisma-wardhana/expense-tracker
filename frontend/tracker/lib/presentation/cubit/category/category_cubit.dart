import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/domain/usecases/expense_usecase.dart';
import 'package:tracker/presentation/cubit/discover/discover_cubit.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ExpenseUseCase expenseUseCase;

  CategoryCubit({required this.expenseUseCase})
      : super(CategoryInit(expenseUseCase));

  Future<void> getCategoryExpense(String category) async {
    emit(CategoryLoading());
    final eitherResponse = await expenseUseCase.getCategoryExpense(category);
    return eitherResponse.fold(
      (err) => emit(CategoryFailed(err.message)),
      (data) => data.length > 0
          ? emit(CategoryHasData(data))
          : emit(CategoryNoData()),
    );
  }
}
