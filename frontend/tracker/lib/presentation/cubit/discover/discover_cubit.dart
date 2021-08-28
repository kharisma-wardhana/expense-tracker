import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/domain/usecases/expense_usecase.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final ExpenseUseCase expenseUseCase;

  DiscoverCubit({required this.expenseUseCase}) : super(DiscoverInit());

  Future<void> getAllExpense() async {
    final eitherResponse = await expenseUseCase.getAllExpense();
    return eitherResponse.fold(
      (err) => emit(DiscoverFailed(message: err.message)),
      (data) => data.length > 0
          ? emit(DiscoverHasData(allExpense: data))
          : emit(DiscoverNoData()),
    );
  }
}
