import 'package:dro_health/src/utils/constants/strings.dart';

class MedicineType {
  static const String capsule = 'Capsule';
  static const String tablet = 'Tablet';
}

class DispensationType {
  static const String pack = 'Pack';
}

class Urls {
  static Uri fakePharmacyUrl = Uri.http('www.fake.url', Strings.pharmacyL);
  static Uri fakeUserUrl = Uri.http('www.fake.url', Strings.userL);
}

List<int> eightInts = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
];
