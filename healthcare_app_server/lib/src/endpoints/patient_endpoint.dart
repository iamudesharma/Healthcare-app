import 'dart:typed_data';

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
    final data = await Patient.find(
      session,
      where: (value) => value.userId.equals(userId),
    );

    return data[0];
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
  bool get requireLogin => true;

  Future<bool> updatePatient(
    Session session,
    Patient patient,
  ) async {
    final userId = await session.auth.authenticatedUserId;

    session.log("Updating patient: ${patient.age} ${patient.image}");
    var cacheKey = 'UserData-$userId';

    await session.caches.local.clear();

    return await Patient.update(session, patient);
  }

  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<ByteData?> getPublicUrl(Session session, String path) async {
    return await session.storage.retrieveFile(
      storageId: 'public',
      path: path,
    );
  }

  Future<void> StoreFile(
      Session session, String path, ByteData byteData) async {
    return await session.storage.storeFile(
      storageId: 'public',
      path: path,
      byteData: byteData,
    );
  }

  
}
