import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';

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

BorderRadius circularRadius(double value) => BorderRadius.all(
      Radius.circular(value),
    );

BorderRadius verticalCircularRadius(double value, {bool top = true}) => top
    ? BorderRadius.vertical(
        top: Radius.circular(value),
      )
    : BorderRadius.vertical(
        bottom: Radius.circular(value),
      );
