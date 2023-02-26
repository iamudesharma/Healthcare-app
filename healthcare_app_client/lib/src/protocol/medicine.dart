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
    this.category,
    this.description,
    this.subCategory,
    required this.idCode,
    this.image,
    this.manufactures,
    this.packaging,
    this.pack_info,
    this.introduction,
    this.benefits,
    this.howToUse,
    this.safetyAdvise,
    this.ingredients,
    this.manufactureAddress,
    this.countryOfOrigin,
    this.medicineType,
    this.useOf,
  });

  factory Medicine.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Medicine(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      category: serializationManager
          .deserialize<String?>(jsonSerialization['category']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      subCategory: serializationManager
          .deserialize<String?>(jsonSerialization['subCategory']),
      idCode:
          serializationManager.deserialize<int>(jsonSerialization['idCode']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
      manufactures: serializationManager
          .deserialize<String?>(jsonSerialization['manufactures']),
      packaging: serializationManager
          .deserialize<String?>(jsonSerialization['packaging']),
      pack_info: serializationManager
          .deserialize<String?>(jsonSerialization['pack_info']),
      introduction: serializationManager
          .deserialize<String?>(jsonSerialization['introduction']),
      benefits: serializationManager
          .deserialize<String?>(jsonSerialization['benefits']),
      howToUse: serializationManager
          .deserialize<String?>(jsonSerialization['howToUse']),
      safetyAdvise: serializationManager
          .deserialize<String?>(jsonSerialization['safetyAdvise']),
      ingredients: serializationManager
          .deserialize<String?>(jsonSerialization['ingredients']),
      manufactureAddress: serializationManager
          .deserialize<String?>(jsonSerialization['manufactureAddress']),
      countryOfOrigin: serializationManager
          .deserialize<String?>(jsonSerialization['countryOfOrigin']),
      medicineType: serializationManager
          .deserialize<String?>(jsonSerialization['medicineType']),
      useOf:
          serializationManager.deserialize<String?>(jsonSerialization['useOf']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? category;

  String? description;

  String? subCategory;

  int idCode;

  String? image;

  String? manufactures;

  String? packaging;

  String? pack_info;

  String? introduction;

  String? benefits;

  String? howToUse;

  String? safetyAdvise;

  String? ingredients;

  String? manufactureAddress;

  String? countryOfOrigin;

  String? medicineType;

  String? useOf;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'subCategory': subCategory,
      'idCode': idCode,
      'image': image,
      'manufactures': manufactures,
      'packaging': packaging,
      'pack_info': pack_info,
      'introduction': introduction,
      'benefits': benefits,
      'howToUse': howToUse,
      'safetyAdvise': safetyAdvise,
      'ingredients': ingredients,
      'manufactureAddress': manufactureAddress,
      'countryOfOrigin': countryOfOrigin,
      'medicineType': medicineType,
      'useOf': useOf,
    };
  }
}
