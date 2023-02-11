import 'package:healthcare_app_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../generated/chemists.dart';

class ChemistsEndpoint extends Endpoint {
  Future<void> addChemists(Session session, Chemists chemists) async {
    session.log("Adding chemists: ${chemists.name}");
    await Chemists.insert(session, chemists);
  }

  Future<Chemists?> currentChemists(Session session) async {
    final userId = await session.auth.authenticatedUserId;
    session.log("Getting chemists: $userId");

    final data = await Chemists.findById(
      session,
      userId!,
    );

    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<List<Chemists>> getChemists(Session session, String name) async {
    session.log("Getting chemists: ");

    return await Chemists.find(
      session,
      limit: 10,
      where: (p0) => p0.name.equals(name),
    );
  }

  // Future<List<Chemists>> getChemistsByAge(Session session, int age) async {
  //   session.log("Getting chemists: ");

  //   return await Chemists.find(
  //     session,
  //     limit: 10,
  //     where: (p0) => p0..equals(age),
  //   );
  // }

  // Future<List<Chemists>> getChemistsByAgeAndName(
  //     Session session, int age, String name) async {
  //   session.log("Getting chemists: ");

  //   return await Chemists.find(
  //     session,
  //     limit: 10,
  //     where: (p0) => p0.age.equals(age) & p0.name.equals(name),
  //   );
  // }

  Future<void> getChemistsGeo(
    Session session,
  ) async {
    session.log("Getting chemists: ");

    const latitude1 = 37.7749;
    const latitude2 = 37.8082;
    const longitude1 = -122.4194;
    const longitude2 = -122.3893;

    // Chemists.find(
    //   session,

    //   where: (p0){
    //     return p0.geoPoint(latitude1, latitude2) & p0.longitude.between(longitude1, longitude2);
    //   },

    // ),
    final data = await session.db
        .query(
            "SELECT name, email, address, latitude, longitude FROM chemists WHERE latitude BETWEEN $latitude1 AND $latitude2 AND longitude BETWEEN $longitude1 AND $longitude2")
        .then((value) => session.log(value.toString()));
  }

  Future<void> updateChemists(Session session, Chemists chemists) async {
    session.log("Updating chemists: ${chemists.name}");
    await Chemists.update(session, chemists);
  }
}
