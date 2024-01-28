import 'package:catfacts/core/usecase/usecase.dart';
import 'package:catfacts/features/data/data_source/cat_remote_data_source.dart';
import 'package:catfacts/features/data/repository/cat_facts.dart';
import 'package:catfacts/features/domain/entity/cat_facts.dart';
import 'package:catfacts/features/domain/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(const CatState(status: LoadingStatus.pure, catFacts:CatEntity(text: '', createdAt: ''))) {
    on<CatEventStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase = await GetCatFactsUseCase(
              CatFactsRepositoryImpl(dataSource: CatNetworkDataSource()))
          .call(const NoParams());

      usecase.either((failure) {
        emit(state.copyWith(status: LoadingStatus.failure));
      }, (catFacts) {
        print(catFacts);
        emit(state.copyWith(status: LoadingStatus.success, catFacts: catFacts));
      });
    });
  }
}
