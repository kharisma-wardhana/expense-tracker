import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ExpenseModel extends Equatable {
  final String name;
  final String? category;
  final double price;
  final DateTime date;
  final String? description;

  ExpenseModel({
    required this.name,
    this.category,
    required this.price,
    required this.date,
    this.description,
  });

  factory ExpenseModel.fromJSON(Map<String, dynamic> json) {
    final dateString = json["Date"]?["date"]?["start"];
    return ExpenseModel(
      name: json["Name"]?["title"]?[0]?["plain_text"] ?? "?",
      category: json["Category"]?["select"]?["name"] ?? "Any",
      price: (json["Price"]?["number"] ?? 0).toDouble(),
      date: dateString != null ? DateTime.parse(dateString) : DateTime.now(),
      description: json['Desc']?['text'] ?? "",
    );
  }

  Map<String, dynamic> toJON() => {
        'name': name,
        'category': category,
        'price': price,
        'date': DateFormat('yyyy-MM-dd HH:mm').format(date),
        'description': description
      };

  @override
  List<Object?> get props => [
        name,
        category,
        price,
        date,
      ];
}
