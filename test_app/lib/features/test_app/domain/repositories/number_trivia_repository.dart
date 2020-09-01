import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failures.dart';
import 'package:test_app/features/test_app/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}