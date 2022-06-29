import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';

List<M> castListTo<M>({
  required List<dynamic> list,
  required Caster<M> caster,
}) {
  return list.map<M>(caster).toList();
}

typedef Caster<M> = M Function(dynamic e);

List<Medicine> getMedicinesFromCategories(List<Category> categories) {
  List<Medicine> medicines = [];
  for (Category category in categories) {
    medicines.addAll(category.medicines);
  }
  return medicines.removeRepetitions();
}
