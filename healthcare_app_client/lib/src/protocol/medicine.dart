/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Medicine extends _i1.SerializableEntity {
  Medicine({
    this.id,
    required this.name,
    required this.images,
    this.description,
    this.therapeuticArea,
    this.activeSubstance,
    this.atcCode,
    this.generic,
    this.condition,
  });

  factory Medicine.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Medicine(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      images: serializationManager
          .deserialize<List<String?>>(jsonSerialization['images']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      therapeuticArea: serializationManager
          .deserialize<String?>(jsonSerialization['therapeuticArea']),
      activeSubstance: serializationManager
          .deserialize<String?>(jsonSerialization['activeSubstance']),
      atcCode: serializationManager
          .deserialize<String?>(jsonSerialization['atcCode']),
      generic: serializationManager
          .deserialize<String?>(jsonSerialization['generic']),
      condition: serializationManager
          .deserialize<String?>(jsonSerialization['condition']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  List<String?> images;

  String? description;

  String? therapeuticArea;

  String? activeSubstance;

  String? atcCode;

  String? generic;

  String? condition;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'description': description,
      'therapeuticArea': therapeuticArea,
      'activeSubstance': activeSubstance,
      'atcCode': atcCode,
      'generic': generic,
      'condition': condition,
    };
  }
}
