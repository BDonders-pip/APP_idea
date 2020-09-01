import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failures.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/features/test_app/data/datasources/number_trivia_local_data_source.dart';
import 'package:test_app/features/test_app/data/datasources/number_trivia_remote_data_source.dart';
import 'package:test_app/features/test_app/domain/entities/number_trivia.dart';
import 'package:test_app/features/test_app/domain/repositories/number_trivia_repository.dart';
import "package:meta/meta.dart";

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }

}