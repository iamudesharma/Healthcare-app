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

    final data = await Patient.findById(
      session,
      userId!,
    );

    if (data != null) {
      return data;
    } else {
      return null;
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
