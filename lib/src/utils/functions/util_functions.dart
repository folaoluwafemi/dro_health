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

bool checkListEquality(List list1, List list2) {
  if (list1.length != list2.length) {
    return false;
  }
  int len = list1.length;
  int count = 0;
  while (count < len) {
    if (list1[count] == list2[count]) {
      return true;
    }
    ++count;
  }
  return false;
}

bool cartContainsMedicine(List<CartItem> cart, Medicine medicine) {
  for (CartItem cartItem in cart) {
    if (cartItem.medicine.id == medicine.id) {
      return true;
    }
  }
  return false;
}

CartItem? searchCartForCartItemFromMedicine(List<CartItem> cart, Medicine medicine) {
  for (CartItem cartItem in cart) {
    if (cartItem.medicine.id == medicine.id) {
      return cartItem;
    }
  }
  return null;
}
