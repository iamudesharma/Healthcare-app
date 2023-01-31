/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Doctor extends _i1.SerializableEntity {
  Doctor({
    this.id,
    this.name,
    this.age,
    this.address,
    this.fees,
    this.experience,
    this.geoPoint,
  });

  factory Doctor.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Doctor(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      age: serializationManager.deserialize<int?>(jsonSerialization['age']),
      address: serializationManager
          .deserialize<String?>(jsonSerialization['address']),
      fees: serializationManager.deserialize<int?>(jsonSerialization['fees']),
      experience: serializationManager
          .deserialize<int?>(jsonSerialization['experience']),
      geoPoint: serializationManager
          .deserialize<_i2.GeoPoint?>(jsonSerialization['geoPoint']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? name;

  int? age;

  String? address;

  int? fees;

  int? experience;

  _i2.GeoPoint? geoPoint;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'fees': fees,
      'experience': experience,
      'geoPoint': geoPoint,
    };
  }
}
