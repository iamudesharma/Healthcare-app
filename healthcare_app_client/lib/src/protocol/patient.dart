/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Patient extends _i1.SerializableEntity {
  Patient({
    this.id,
    required this.name,
    this.age,
    this.gender,
    this.weight,
    this.height,
    required this.createdAt,
    required this.userId,
    this.address,
    this.phoneNo,
    this.geoPoint,
    this.image,
  });

  factory Patient.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Patient(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      age: serializationManager.deserialize<int?>(jsonSerialization['age']),
      gender: serializationManager
          .deserialize<String?>(jsonSerialization['gender']),
      weight: serializationManager
          .deserialize<String?>(jsonSerialization['weight']),
      height: serializationManager
          .deserialize<String?>(jsonSerialization['height']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      address: serializationManager
          .deserialize<String?>(jsonSerialization['address']),
      phoneNo:
          serializationManager.deserialize<int?>(jsonSerialization['phoneNo']),
      geoPoint: serializationManager
          .deserialize<_i2.GeoPoint?>(jsonSerialization['geoPoint']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int? age;

  String? gender;

  String? weight;

  String? height;

  DateTime createdAt;

  int userId;

  String? address;

  int? phoneNo;

  _i2.GeoPoint? geoPoint;

  String? image;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'createdAt': createdAt,
      'userId': userId,
      'address': address,
      'phoneNo': phoneNo,
      'geoPoint': geoPoint,
      'image': image,
    };
  }
}
