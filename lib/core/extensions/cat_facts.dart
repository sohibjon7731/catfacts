import 'package:catfacts/features/data/models/cat_facts.dart';
import 'package:catfacts/features/domain/entity/cat_facts.dart';

extension ProductModelExtension on CatModel {
  CatEntity get toEntity {
    return CatEntity(text: text, createdAt: createdAt);
  }
}
