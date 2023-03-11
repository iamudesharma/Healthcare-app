import 'dart:math';

import 'package:serverpod/server.dart';

import '../generated/invertory.dart';

class InventoryEndpoint extends Endpoint {
  Future<void> addToInventory(Session session, Inventory inventory) async {
    await Inventory.insert(session, inventory);
  }

  Future<void> updateInventory(Session session, Inventory inventory) async {
    await Inventory.update(session, inventory);
  }

  Future<List<Inventory>?> getInventory(Session session) async {
    final userId = await session.auth.authenticatedUserId;
    session.log("User id is ${userId.toString()}");
    return await Inventory.find(
      session,
      limit: 10,
      where: (p0) => p0.storeId.equals(userId),
    );
  }
}
