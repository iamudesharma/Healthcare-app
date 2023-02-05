import 'package:healthcare_app_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

class PatientEndpoint extends Endpoint {
  Future<void> cratePatient(
    Session session,
    Patient patient,
  ) async {
    session.log("Creating patient: ${patient.age} ${patient.name}");
    await Patient.insert(session, patient);
  }

  Future<Patient?> currentPatient(
    Session session,
  ) async {
    final userId = await session.auth.authenticatedUserId;
    session.log("Getting patient: $userId");

    var cacheKey = 'UserData-$userId';

    // Try to retrieve the object from the cache
    var patient = await session.caches.local.get<Patient>(cacheKey);

    if (patient == null) {
      final data = await Patient.find(
        session,
        where: (value) => value.userId.equals(userId),
      );

      await session.caches.local.put(
        cacheKey,
        data[0],
        lifetime: Duration(minutes: 20),
      );

      return data[0];
    } else {
      return patient;
    }
  }

  Future<List<Patient>> getPatient(
    Session session,
  ) async {
    session.log("Getting patient: ");

    return await Patient.find(
      session,
      limit: 10,
      orderBy: Patient.t.createdAt,
    );
  }

  @override
  // TODO: implement requireLogin
  bool get requireLogin => true;
}
