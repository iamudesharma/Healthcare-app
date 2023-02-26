import 'package:serverpod/server.dart';

import '../generated/invertory.dart';

class InventoryEndpoint extends Endpoint {
  Future<void> addToInventory(Session session, Inventory inventory) async {
    await Inventory.insert(session, inventory);
  }

  Future<void> updateInventory(Session session, Inventory inventory) async {
    await Inventory.update(session, inventory);
  }
}
