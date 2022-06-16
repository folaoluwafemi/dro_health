import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class CartItemFactory {
  static CartItem fromMap(Map<String, dynamic> map) {
    return CartItem(
      medicine: MedicineFactory.fromMap(map[Keys.cartMedicine]),
      quantity: map[Keys.cartQuantity],
    );
  }

  static Map<String, dynamic> toMap(CartItem item) {
    return <String, dynamic>{
      Keys.cartMedicine: MedicineFactory.toMap(item.medicine),
      Keys.cartQuantity: item.quantity,
    };
  }
}
