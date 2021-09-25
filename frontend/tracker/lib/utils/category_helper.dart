import 'package:tracker/common/enums.dart';

String getCategoryString(CategoryItem cat) {
  String category = '';
  switch (cat) {
    case CategoryItem.Fashion:
      category = 'Fashion';
      break;
    case CategoryItem.Entertainment:
      category = 'Entertainment';
      break;
    case CategoryItem.Food:
      category = 'Food';
      break;
    case CategoryItem.Investment:
      category = 'Investment';
      break;
    case CategoryItem.Transportation:
      category = 'Transportation';
      break;
  }
  return category;
}
