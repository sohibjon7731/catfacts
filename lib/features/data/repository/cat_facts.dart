import 'package:catfacts/core/either/either.dart';
import 'package:catfacts/core/exception/exception.dart';

import 'package:catfacts/core/failure/failure.dart';
import 'package:catfacts/features/data/data_source/cat_remote_data_source.dart';
import 'package:catfacts/features/domain/entity/cat_facts.dart';
import 'package:catfacts/features/domain/repository/cat_facts.dart';

class CatFactsRepositoryImpl implements CatFactsRepository {
  final CatNetworkDataSource _dataSource;
  CatFactsRepositoryImpl({required CatNetworkDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<ServerFailure, CatEntity>> getCatFacts() async {
    try {
      final response = await _dataSource.getCatFacts();
      return Right(CatEntity.toEntity(response));
    } on ServerException catch (exception) {
      return Left(ServerFailure.fromServerException(exception));
    }
  }
}
