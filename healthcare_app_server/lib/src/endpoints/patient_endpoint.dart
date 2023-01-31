import 'package:healthcare_app_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class PatientEndpoint extends Endpoint {
  Future<void> cratePatient(
    Session session,
    Patient patient,
  ) async {
    session.log("Creating patient: ${patient.age} ${patient.name}");
    await Patient.insert(session, patient);
  }

  Future<List<Patient?>> getPatient(
    Session session,
    // int id,
  ) async {
    // session.log("Getting patient: $id");

    final userId = await session.auth.authenticatedUserId;
    session.log("Getting patient: $userId");

    return await Patient.find(
      session,
      where: (p0) => p0.userId.equals(userId),
    );
  }
}
