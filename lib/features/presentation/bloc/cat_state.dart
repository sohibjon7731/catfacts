// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cat_bloc.dart';

class CatState extends Equatable {
  final LoadingStatus status;
  final CatEntity catFacts;
  const CatState({
    required this.status,
    required this.catFacts,
  });
  
  @override
  List<Object?> get props => [status, catFacts];


  @override
  bool get stringify => true;

  CatState copyWith({
    LoadingStatus? status,
    CatEntity? catFacts,
  }) {
    return CatState(
      status: status ?? this.status,
      catFacts: catFacts ?? this.catFacts,
    );
  }
}

enum LoadingStatus {
  pure,
  loading,
  failure,
  success,
}
