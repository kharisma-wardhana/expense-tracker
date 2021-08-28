part of 'discover_cubit.dart';

class DiscoverState extends Equatable {
  @override
  List<Object?> get props => [];
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
