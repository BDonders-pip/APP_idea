import 'package:test_app/features/test_app/domain/repositories/number_trivia_repository.dart';
import 'package:test_app/features/test_app/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failures.dart';
import "package:meta/meta.dart";

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({
    @required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
