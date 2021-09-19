part of 'budget_cubit.dart';

abstract class BudgetState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class BudgetInitial extends BudgetState {}

class BudgetHasData extends BudgetState {}

class BudgetNoData extends BudgetState {}

class BudgetFailed extends BudgetState {}
