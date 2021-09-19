import 'package:get_it/get_it.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/data/local/datasource/local_expense_datasource.dart';
import 'package:tracker/data/remote/datasource/expense_datasource.dart';
import 'package:tracker/data/remote/datasource/user_datasource.dart';
import 'package:tracker/data/repository/expense_repo_impl.dart';
import 'package:tracker/data/repository/user_repo_impl.dart';
import 'package:tracker/domain/repository/expense_repo.dart';
import 'package:tracker/domain/repository/user_repo.dart';
import 'package:tracker/domain/usecases/auth_usecase.dart';
import 'package:tracker/domain/usecases/expense_usecase.dart';
import 'package:tracker/presentation/cubit/cubit.dart';
import 'package:tracker/utils/dio_helper.dart';

final injector = GetIt.I;

Future init() async {
  injector.registerLazySingleton(
    () => DioHelper(apiBaseUrl: ApiConstant.baseURLNotion),
  );

  injector.registerLazySingleton<UserDatasource>(
    () => UserDatasourceImpl(),
  );
  injector.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(userDatasource: injector<UserDatasource>()),
  );
  injector.registerLazySingleton<AuthUseCase>(
    () => AuthUseCaseImpl(userRepo: injector<UserRepo>()),
  );
  injector.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authUseCase: injector<AuthUseCase>()),
  );

  injector.registerLazySingleton<ExpenseDatasource>(
    () => ExpenseDatasourceImpl(client: injector<DioHelper>()),
  );
  injector.registerLazySingleton<LocalExpenseDatasource>(
    () => LocalExpenseDatasourceImpl(),
  );
  injector.registerLazySingleton<ExpenseRepo>(
    () => ExpenseRepoImpl(
      remoteExpenseDatasource: injector<ExpenseDatasource>(),
      localExpenseDatasource: injector<LocalExpenseDatasource>(),
    ),
  );
  injector.registerLazySingleton<ExpenseUseCase>(
    () => ExpenseUseCaseImpl(expenseRepo: injector<ExpenseRepo>()),
  );
  injector.registerLazySingleton<DiscoverCubit>(
    () => DiscoverCubit(expenseUseCase: injector<ExpenseUseCase>()),
  );

  injector.registerLazySingleton<CategoryCubit>(
    () => CategoryCubit(expenseUseCase: injector<ExpenseUseCase>()),
  );

  injector.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  injector.registerLazySingleton<BudgetCubit>(() => BudgetCubit());
}
