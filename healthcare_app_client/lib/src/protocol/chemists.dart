/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Chemists extends _i1.SerializableEntity {
  Chemists({
    this.id,
    required this.name,
    this.address,
    this.geoPoint,
    required this.images,
    this.openTime,
    this.closeTime,
    this.email,
    this.phoneNo,
    required this.userId,
    this.latitude,
    this.longitude,
  });

  factory Chemists.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Chemists(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      address: serializationManager
          .deserialize<String?>(jsonSerialization['address']),
      geoPoint: serializationManager
          .deserialize<_i2.GeoPoint?>(jsonSerialization['geoPoint']),
      images: serializationManager
          .deserialize<List<String?>>(jsonSerialization['images']),
      openTime: serializationManager
          .deserialize<DateTime?>(jsonSerialization['openTime']),
      closeTime: serializationManager
          .deserialize<DateTime?>(jsonSerialization['closeTime']),
      email:
          serializationManager.deserialize<String?>(jsonSerialization['email']),
      phoneNo:
          serializationManager.deserialize<int?>(jsonSerialization['phoneNo']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      latitude: serializationManager
          .deserialize<double?>(jsonSerialization['latitude']),
      longitude: serializationManager
          .deserialize<double?>(jsonSerialization['longitude']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? address;

  _i2.GeoPoint? geoPoint;

  List<String?> images;

  DateTime? openTime;

  DateTime? closeTime;

  String? email;

  int? phoneNo;

  int userId;

  double? latitude;

  double? longitude;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'geoPoint': geoPoint,
      'images': images,
      'openTime': openTime,
      'closeTime': closeTime,
      'email': email,
      'phoneNo': phoneNo,
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
