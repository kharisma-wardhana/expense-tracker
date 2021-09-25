import 'package:hive/hive.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/data/remote/model/expense_model.dart';
import 'package:tracker/data/remote/model/user_model.dart';

class DBHive {
  late Box<dynamic> appTheme;
  late Box<dynamic> userData;
  late Box<dynamic> expenseData;

  DBHive() {
    appTheme = Hive.box(AppConstant.appTheme);
    expenseData = Hive.box(AppConstant.expenseData);
    userData = Hive.box(AppConstant.userData);
  }

  Future<bool> darkMode(bool value) async {
    appTheme.put(AppConstant.keyAppTheme, value);
    return value;
  }

  Future<UserModel> setUserData(UserModel user) async {
    try {
      userData.put(AppConstant.keyUserData, user);
      return user;
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  Future<List<ExpenseModel>> setExpenseData(ExpenseModel expense) async {
    try {
      expenseData.put(AppConstant.keyExpenseData, expense);
      return expenseData.values.toList().cast<ExpenseModel>();
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  bool isDarkMode() {
    return appTheme.get(AppConstant.keyAppTheme, defaultValue: false);
  }

  UserModel getUserData() {
    return userData.get(AppConstant.keyUserData);
  }

  List<ExpenseModel> getExpenseData() {
    return expenseData.get(AppConstant.keyExpenseData);
  }
}
