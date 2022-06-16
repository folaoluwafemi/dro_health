import 'package:dro_health/src/data/data_source/pharmacy_source/interface.dart';
import 'package:dro_health/src/models/medicine/medicine_model.dart';
import 'package:dro_health/src/models/pharmacy/pharmacy.dart';
import 'package:dro_health/src/utils/constants/assets.dart';

class PharmacySource implements PharmacySourceInterface {
  @override
  Future<Pharmacy> get() async {
    await _createNewPharmacy();

    throw UnimplementedError();
  }

  @override
  Future<void> post(Pharmacy pharmacy) async {}

  _createNewPharmacy() {
    _createMedicines();

    Pharmacy(
      medicines: medicines,
      categories: categories,
    );
  }

  void _createMedicines() {
    _createMedicine();
  }

  void _createMedicine() {
    Medicine(
      id: id,
      name: name,
      imagePath: imagePath,
      packSize: packSize,
      constituents: constituents,
      dispensationType: dispensationType,
      type: type,
      price: price,
      seller: seller1,
    );
  }
}

Seller seller1 = const Seller(
  name: 'Emzor Pharmaceuticals',
  imagePath: Assets.emzorLogo,
);
