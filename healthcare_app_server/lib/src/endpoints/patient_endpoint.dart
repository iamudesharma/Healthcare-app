import 'package:healthcare_app_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class PatientEndpoint extends Endpoint {
  Future<void> cratePatient(Session session, Patient patient) async {
    await Patient.insert(session, patient);
  }
}
