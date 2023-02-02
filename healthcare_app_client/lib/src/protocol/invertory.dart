/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Inventory extends _i1.SerializableEntity {
  Inventory({
    this.id,
    required this.medicineId,
    required this.price,
    required this.stock,
    required this.chemistsId,
  });

  factory Inventory.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Inventory(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      medicineId: serializationManager
          .deserialize<int>(jsonSerialization['medicineId']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      stock: serializationManager.deserialize<int>(jsonSerialization['stock']),
      chemistsId: serializationManager
          .deserialize<int>(jsonSerialization['chemistsId']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int medicineId;

  int price;

  int stock;

  int chemistsId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicineId': medicineId,
      'price': price,
      'stock': stock,
      'chemistsId': chemistsId,
    };
  }
}
