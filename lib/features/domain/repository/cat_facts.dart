import 'package:catfacts/core/either/either.dart';
import 'package:catfacts/core/failure/failure.dart';
import 'package:catfacts/features/domain/entity/cat_facts.dart';

abstract class CatFactsRepository {
  Future<Either<ServerFailure, CatEntity>> getCatFacts();
}
