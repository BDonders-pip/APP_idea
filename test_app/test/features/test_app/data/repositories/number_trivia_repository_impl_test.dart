import 'package:flutter_test/flutter_test.dart';
import "package:mockito/mockito.dart";
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/features/test_app/data/datasources/number_trivia_local_data_source.dart';
import 'package:test_app/features/test_app/data/datasources/number_trivia_remote_data_source.dart';
import 'package:test_app/features/test_app/data/repositories/number_trivia_repository_impl.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}