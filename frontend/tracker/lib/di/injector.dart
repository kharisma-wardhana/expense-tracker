import 'package:get_it/get_it.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/data/remote/datasource/expense_datasource.dart';
import 'package:tracker/data/remote/datasource/user_datasource.dart';
import 'package:tracker/data/remote/repository/expense_repo_impl.dart';
import 'package:tracker/data/remote/repository/user_repo_impl.dart';
import 'package:tracker/domain/repository/expense_repo.dart';
import 'package:tracker/domain/repository/user_repo.dart';
import 'package:tracker/domain/usecases/auth_usecase.dart';
import 'package:tracker/domain/usecases/expense_usecase.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/cubit/category/category_cubit.dart';
import 'package:tracker/presentation/cubit/cubit.dart';
import 'package:tracker/presentation/cubit/discover/discover_cubit.dart';
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
    () => UserRepoImpl(userDatasource: injector()),
  );
  injector.registerLazySingleton<AuthUseCase>(
    () => AuthUseCaseImpl(userRepo: injector()),
  );
  injector.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authUseCase: injector()),
  );

  injector.registerLazySingleton<ExpenseDatasource>(
    () => ExpenseDatasourceImpl(client: injector<DioHelper>()),
  );
  injector.registerLazySingleton<ExpenseRepo>(
    () => ExpenseRepoImpl(expenseDatasource: injector()),
  );
  injector.registerLazySingleton<ExpenseUseCase>(
    () => ExpenseUseCaseImpl(expenseRepo: injector()),
  );
  injector.registerLazySingleton<DiscoverCubit>(
    () => DiscoverCubit(expenseUseCase: injector()),
  );

  injector.registerLazySingleton<CategoryCubit>(
    () => CategoryCubit(expenseUseCase: injector()),
  );

  injector.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
  );
}
