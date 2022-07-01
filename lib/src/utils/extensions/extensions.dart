import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get queryScreenSize => MediaQuery.of(this).size;
}

extension ListExtension<T> on List<T> {
  removeRepetitions() => _removeRepetitions<T>(this);
}

extension RadiusExtension on BorderRadius {
  static valueCircular(double value) => BorderRadius.all(Radius.circular(value));
}

List<T> _removeRepetitions<T>(List<T> list) {
  Set<T> set = Set<T>.from(list);
  return set.toList();
}
