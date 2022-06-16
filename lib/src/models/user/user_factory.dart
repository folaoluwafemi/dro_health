import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/utils/constants/keys.dart';

class UserFactory {
  static User fromMap(Map<String, dynamic> map) {
    return User(
      favorites: castListTo<String>(
        list: map[Keys.userFavorites],
        caster: (e) => e.toString(),
      ),
      cart: castListTo<CartItem>(
        list: map[Keys.userCart],
        caster: (dynamic rawCart) => CartItemFactory.fromMap(rawCart),
      ),
      name: map[Keys.userName],
      email: map[Keys.userEmail],
    );
  }

  static Map<String, dynamic> toMap(User user) {
    return <String, dynamic>{
      Keys.userName: user.name,
      Keys.userEmail: user.email,
      Keys.userFavorites: user.favorites,
      Keys.userCart: castListTo<Map<String, dynamic>>(
        list: user.cart,
        caster: (e) => CartItemFactory.toMap(e as CartItem),
      ),
    };
  }
}
