import 'package:app_ingredients/features/ingredients_app/data/datasources/ingredient_local_data_source.dart';
import 'package:app_ingredients/features/ingredients_app/data/datasources/ingredient_remote_data_source.dart';
import 'package:app_ingredients/features/ingredients_app/data/repositories/ingredient_repository_impl.dart';
import 'package:app_ingredients/features/ingredients_app/domain/repositories/ingredient_repository.dart';
import 'package:app_ingredients/features/ingredients_app/domain/usecases/get_ingredient.dart';
import 'package:app_ingredients/features/ingredients_app/presentation/bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';

// Server Locator
final sl = GetIt.instance;

Future<void> init() async {
  // Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => IngredientBloc(ingredient: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetIngredient(sl()));

  // Repository
  sl.registerLazySingleton<IngredientRepository>(
        () => IngredientRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<IngredientRemoteDataSource>(() => IngredientRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<IngredientLocalDataSource>(() => IngredientLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}