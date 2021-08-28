import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String name;
  final String? description;
  final String? category;
  final double price;
  final DateTime date;

  ExpenseEntity({
    required this.name,
    this.description,
    this.category,
    required this.price,
    required this.date,
  });

  @override
  List<Object?> get props => [];
}
