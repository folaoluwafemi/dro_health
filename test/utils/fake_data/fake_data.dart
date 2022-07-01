import 'dart:convert';

import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/utils.dart';

final CartItem cartItem1 = CartItem(
  medicine: redParacetamol,
  quantity: 1,
);

final CartItem cartItem2 = CartItem(
  medicine: redParacetamol,
  quantity: 3
);

Category headacheCategory = Category(
  name: Strings.headache,
  imagePath: Assets.headacheCategory,
  medicines: [
    panadol,
    redParacetamol,
    orangeParacetamol,
  ],
);
Category supplementsCategory = Category(
  name: Strings.supplements,
  imagePath: Assets.supplementsCategory,
  medicines: [
    doliprane,
    panadol,
  ],
);
Category infantsCategory = Category(
  name: Strings.infants,
  imagePath: Assets.infantCategory,
  medicines: [
    redParacetamol,
    redIbuprofen,
  ],
);
Category coughCategory = Category(
  name: Strings.cough,
  imagePath: Assets.coughCategory,
  medicines: [
    redParacetamol,
    orangeParacetamol,
    redIbuprofen,
    orangeIbuprofen,
    doliprane,
    panadol,
  ],
);

final Medicine redParacetamol = MedicineModelHelper.fake(
  name: Strings.paracetamol,
  imagePath: Assets.redParacetamol,
  type: MedicineType.tablet,
);

final Medicine orangeParacetamol = MedicineModelHelper.fake(
  name: Strings.paracetamol,
  imagePath: Assets.orangeParacetamol,
  type: MedicineType.tablet,
);

final Medicine redIbuprofen = MedicineModelHelper.fake(
  name: Strings.ibuprofen,
  imagePath: Assets.ibuprofenRed,
  type: MedicineType.tablet,
);

final Medicine orangeIbuprofen = MedicineModelHelper.fake(
  name: Strings.ibuprofen,
  imagePath: Assets.ibuprofenOrange,
  type: MedicineType.tablet,
);

final Medicine doliprane = MedicineModelHelper.fake(
  name: Strings.doliprane,
  imagePath: Assets.doliprane,
  type: MedicineType.capsule,
);
final Medicine panadol = MedicineModelHelper.fake(
  name: Strings.panadol,
  imagePath: Assets.panadol,
  type: MedicineType.tablet,
);

String getUser() {
  User newUser = createUser();
  String rawUser = jsonEncode(UserHelper.toMap(newUser));
  return rawUser;
}

User createUser() {
  return const User(
    email: 'random@email.com',
    name: 'John Doe',
    cart: [],
    favorites: [],
  );
}
