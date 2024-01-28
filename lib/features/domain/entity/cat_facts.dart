// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catfacts/features/data/models/cat_facts.dart';
import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String text;
  final String createdAt;
  const CatEntity({
    required this.text,
    required this.createdAt,
  });
  
  @override
  
  List<Object?> get props => [text, createdAt];
  factory CatEntity.toEntity(CatModel catModel) {
    return CatEntity(
        text: catModel.text, createdAt: catModel.createdAt);
  }
}
