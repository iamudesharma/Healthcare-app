
import 'package:serverpod/server.dart';

import '../generated/chemists.dart';

class ChemistsEndpoint extends  Endpoint {
 


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

  Future<void> updateChemists(Session session, Chemists chemists) async {
    session.log("Updating chemists: ${chemists.name}");
    await Chemists.update(session, chemists);
  }
}