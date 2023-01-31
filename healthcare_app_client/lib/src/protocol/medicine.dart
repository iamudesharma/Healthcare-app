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
    required this.price,
    this.discountPrice,
    required this.images,
    required this.chemistsId,
    this.description,
  });

  factory Medicine.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Medicine(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      discountPrice: serializationManager
          .deserialize<int?>(jsonSerialization['discountPrice']),
      images: serializationManager
          .deserialize<List<String?>>(jsonSerialization['images']),
      chemistsId: serializationManager
          .deserialize<int>(jsonSerialization['chemistsId']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int price;

  int? discountPrice;

  List<String?> images;

  int chemistsId;

  String? description;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'discountPrice': discountPrice,
      'images': images,
      'chemistsId': chemistsId,
      'description': description,
    };
  }
}
