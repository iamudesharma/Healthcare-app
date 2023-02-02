import 'package:serverpod/server.dart';

import '../generated/medicine.dart';

class MedicineEndpoint extends Endpoint {
  Future<String?> addMedicine(Session session, Medicine medicine) async {
    try {
      await Medicine.insert(session, medicine);

      return "Medicine added successfully";
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
