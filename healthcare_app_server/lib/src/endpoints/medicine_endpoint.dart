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

  Future<List<Medicine?>> getMedicines(Session session) async {
    return await Medicine.find(
      session,
      limit: 10,
    );
  }

  Future<List<Medicine?>?> searchMedicine(Session session, String query,
      {int? limit}) async {
    final data = await Medicine.find(
      session,
      where: (p0) => p0.name.equals(query),
      limit: limit ?? 10,
      useCache: true,
    );

    if (data.isNotEmpty) {
      return data;
    } else {
      return null;
    }
  }

  @override
  bool get requireLogin => true;
}
