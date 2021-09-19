part of 'discover_cubit.dart';

abstract class DiscoverState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class DiscoverInit extends DiscoverState {}

class DiscoverHasData extends DiscoverState {
  final List<ExpenseEntity> allExpense;
  DiscoverHasData({required this.allExpense});
}

class DiscoverNoData extends DiscoverState {}

class DiscoverFailed extends DiscoverState {
  final String message;
  DiscoverFailed({required this.message});
}
