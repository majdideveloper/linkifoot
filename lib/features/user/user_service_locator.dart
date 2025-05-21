import 'package:linkifoot/features/user/data/datasources/remote/supabase_user_remote_data_source.dart';
import 'package:linkifoot/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:linkifoot/features/user/data/repositories/user_repository_impl.dart';
import 'package:linkifoot/features/user/domain/repositories/user_repository.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/get_current_uid_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/is_sign_in_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/sign_in_user_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/sign_out_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/sign_up_user_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/user/create_user_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/user/follow_unfollow_user_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/user/update_user_usecase.dart';
import 'package:linkifoot/features/user/presentation/cubit/credential_cubit.dart';
import 'package:linkifoot/service_locator.dart';

Future<void> userServiceLocator() async {
  // * CUBITS INJECTION
  sl.registerFactory(
    () => CredentialCubit(
      signUpUseCase: sl.call(),
      signInUserUseCase: sl.call(),
    ),
  );

  // * USE CASES INJECTION
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl.call()));
  // sl.registerLazySingleton(() => GetUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));
  // sl.registerLazySingleton(() => GetSingleUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => FollowUnFollowUseCase(repository: sl.call()));
  // sl.registerLazySingleton(() => GetSingleOtherUserUseCase(repository: sl.call()));

  // * DATA SOURCES INJECTION
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => SupabaseUserRemoteDataSource(supabase: sl.call()));
}
