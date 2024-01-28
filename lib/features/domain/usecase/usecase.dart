import 'package:catfacts/core/either/either.dart';
import 'package:catfacts/core/failure/failure.dart';
import 'package:catfacts/core/usecase/usecase.dart';
import 'package:catfacts/features/domain/entity/cat_facts.dart';
import 'package:catfacts/features/domain/repository/cat_facts.dart';

class GetCatFactsUseCase implements UseCase<CatEntity, NoParams> {
  final CatFactsRepository _catFactsRepository;
  GetCatFactsUseCase(CatFactsRepository catFactsRepository)
      : _catFactsRepository = catFactsRepository;

  @override
  Future<Either<Failure, CatEntity>>call(NoParams params) async {
    return await _catFactsRepository.getCatFacts();
  }
}
