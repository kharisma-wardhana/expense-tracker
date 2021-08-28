import 'package:get_it/get_it.dart';
import 'package:tracker/data/remote/datasource/user_datasource.dart';
import 'package:tracker/data/remote/repository/user_repo_impl.dart';
import 'package:tracker/domain/repository/user_repo.dart';
import 'package:tracker/domain/usecases/auth_usecase.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';

final injector = GetIt.I;

Future init() async {
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
}
