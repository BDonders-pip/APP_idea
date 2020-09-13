import 'package:app_ingredients/core/error/exceptions.dart';
import 'package:app_ingredients/core/network/network_info.dart';
import 'package:app_ingredients/features/ingredients_app/data/datasources/ingredient_local_data_source.dart';
import 'package:app_ingredients/features/ingredients_app/data/datasources/ingredient_remote_data_source.dart';
import 'package:app_ingredients/features/ingredients_app/domain/entities/ingredient.dart';
import 'package:app_ingredients/features/ingredients_app/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:app_ingredients/core/error/failures.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientRemoteDataSource remoteDataSource;
  final IngredientLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  IngredientRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Ingredient>> getIngredient(String name) async {
    return await _getIngredient(() {
      return remoteDataSource.getIngredient(name);
    });
  }

  @override
  Future<Either<Failure, Ingredient>> _getIngredient(getIngredient) async {

    if (await networkInfo.isConnected) {
      try {
        final remoteIngredient = await getIngredient();
        localDataSource.cacheIngredient(remoteIngredient);
        return Right(remoteIngredient);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localIngredient = await localDataSource.getLastIngredient();
        return Right(localIngredient);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
