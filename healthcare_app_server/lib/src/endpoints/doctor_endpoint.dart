import 'package:healthcare_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DoctorEndpoint extends Endpoint {
  Future<void> addDoctor(Session session, Doctor doctor) async {
    session.log("Adding doctor: ${doctor.name}");
    await Doctor.insert(session, doctor);
  }

  Future<Doctor?> currentDoctor(Session session) async {
    final userId = await session.auth.authenticatedUserId;
    session.log("Getting doctor: $userId");

    final data = await Doctor.findById(
      session,
      userId!,
    );

    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<List<Doctor>> getDoctor(Session session, String name) async {
    session.log("Getting doctor: ");

    return await Doctor.find(
      session,
      limit: 10,
      where: (p0) => p0.name.equals(name),
    );
  }

  Future<List<Doctor>> getDoctorByAge(Session session, int age) async {
    session.log("Getting doctor: ");

    return await Doctor.find(
      session,
      limit: 10,
      where: (p0) => p0.age.equals(age),
    );
  }

  Future<List<Doctor>> getDoctorByAgeAndName(
      Session session, int age, String name) async {
    session.log("Getting doctor: ");

    return await Doctor.find(
      session,
      limit: 10,
      where: (p0) => p0.age.equals(age) & p0.name.equals(name),
    );
  }

  Future<void> updateDoctor(Session session, Doctor doctor) async {
    session.log("Updating doctor: ${doctor.name}");
    await Doctor.update(session, doctor);
  }

  // Future<List<Doctor>> getDoctorByGeoPoint(Session session) {
  //   // return Doctor.find(session, where: (p0) => p0.geoPoint))
  //   //
  //   // ;

  //   session.db.query(
  //       'SELECT * FROM doctor WHERE geo_point = ST_GeomFromText(\'POINT(1.0 1.0)\')');
  // }
}
