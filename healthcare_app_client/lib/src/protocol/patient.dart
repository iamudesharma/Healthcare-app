/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/module.dart' as _i2;

class Patient extends _i1.SerializableEntity {
  Patient({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    this.weight,
    this.height,
    required this.createdAt,
    required this.userInfo,
  });

  factory Patient.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Patient(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      age: serializationManager.deserialize<int>(jsonSerialization['age']),
      gender:
          serializationManager.deserialize<String>(jsonSerialization['gender']),
      weight: serializationManager
          .deserialize<String?>(jsonSerialization['weight']),
      height: serializationManager
          .deserialize<String?>(jsonSerialization['height']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo>(jsonSerialization['userInfo']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int age;

  String gender;

  String? weight;

  String? height;

  DateTime createdAt;

  _i2.UserInfo userInfo;

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
      'userInfo': userInfo,
    };
  }
}
