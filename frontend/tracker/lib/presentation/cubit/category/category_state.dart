part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class CategoryInit extends CategoryState {
  final expenseUseCase;
  final List<ExpenseEntity> allExpense =
      injector<DiscoverCubit>().state is DiscoverHasData
          ? (injector<DiscoverCubit>().state as DiscoverHasData).allExpense
          : [];
  CategoryInit(this.expenseUseCase);
}

class CategoryHasData extends CategoryState {
  final List<ExpenseEntity> allExpense;
  CategoryHasData(this.allExpense);
}

class CategoryNoData extends CategoryState {}

class CategoryFailed extends CategoryState {
  final String message;
  CategoryFailed(this.message);
}

class CategoryLoading extends CategoryState {}
