import 'package:serverpod/database.dart';
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

  Future<Medicine?> searchMedicine(Session session, String query,
      {int? limit}) async {
    final data = await Medicine.find(
      session,
      where: (p0) => p0.name.equals(query),
      limit: 1,
    );

    session.log(data.length.toString() + " data found");

    if (data.isNotEmpty) {
      return data[0];
    } else {
      return null;
    }
  }

  Future<List<String>?> searchSuggestionsForMedicine(
      Session session, String query) async {
    List<String> _list = [];
    final data = await session.db.query(
        "SELECT DISTINCT name FROM public.medicine	WHERE name ILIKE '$query%' ORDER BY name ");

    session.log(data.length.toString() + " data found");

    data.forEach((element) {
      session.log(element[0]);
    });

    for (var element in data) {
      _list.add(element[0]);
    }

    return _list;

    // session.log(data.length.toString() + " data found");

    // if (data.isNotEmpty) {
    //   return data.map((e) => e.name!).toList();
    // } else {
    //   return [];
    // }
  }

  @override
  bool get requireLogin => true;
}
