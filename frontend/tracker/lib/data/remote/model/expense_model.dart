import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 1)
class ExpenseModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? category;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String? description;

  const ExpenseModel({
    required this.name,
    this.category,
    required this.price,
    required this.date,
    this.description,
  });

  factory ExpenseModel.fromJSON(Map<String, dynamic> json) {
    final dateString = json['Date']?['date']?['start'];
    return ExpenseModel(
      name: json['Name']?['title']?[0]?['plain_text'] ?? '?',
      category: json['Category']?['select']?['name'] ?? 'Any',
      price: (json['Price']?['number'] ?? 0).toDouble(),
      date: dateString != null ? DateTime.parse(dateString) : DateTime.now(),
      description: json['Desc']?['rich_text']?[0]?['plain_text'] ?? '',
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
