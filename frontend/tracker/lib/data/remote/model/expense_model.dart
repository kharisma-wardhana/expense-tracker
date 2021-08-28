import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final String name;
  final String? category;
  final double price;
  final DateTime date;

  ExpenseModel({
    required this.name,
    this.category,
    required this.price,
    required this.date,
  });

  factory ExpenseModel.fromJSON(Map<String, dynamic> json) {
    final dateString = json["Date"]?["date"]?["start"];
    return ExpenseModel(
      name: json["Name"]?["title"]?[0]?["plain_text"] ?? "?",
      category: json["Category"]?["select"]?["name"] ?? "Any",
      price: (json["Price"]?["number"] ?? 0).toDouble(),
      date: dateString != null ? DateTime.parse(dateString) : DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [];
}
