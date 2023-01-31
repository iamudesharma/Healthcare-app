/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Medicine extends _i1.TableRow {
  Medicine({
    int? id,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.images,
    required this.chemistsId,
    this.description,
  }) : super(id);

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

  static final t = MedicineTable();

  String name;

  int price;

  int? discountPrice;

  List<String?> images;

  int chemistsId;

  String? description;

  @override
  String get tableName => 'medicine';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'price':
        price = value;
        return;
      case 'discountPrice':
        discountPrice = value;
        return;
      case 'images':
        images = value;
        return;
      case 'chemistsId':
        chemistsId = value;
        return;
      case 'description':
        description = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Medicine>> find(
    _i1.Session session, {
    MedicineExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Medicine>(
      where: where != null ? where(Medicine.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Medicine?> findSingleRow(
    _i1.Session session, {
    MedicineExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Medicine>(
      where: where != null ? where(Medicine.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Medicine?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Medicine>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required MedicineExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Medicine>(
      where: where(Medicine.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Medicine row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Medicine row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Medicine row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    MedicineExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Medicine>(
      where: where != null ? where(Medicine.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef MedicineExpressionBuilder = _i1.Expression Function(MedicineTable);

class MedicineTable extends _i1.Table {
  MedicineTable() : super(tableName: 'medicine');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final price = _i1.ColumnInt('price');

  final discountPrice = _i1.ColumnInt('discountPrice');

  final images = _i1.ColumnSerializable('images');

  final chemistsId = _i1.ColumnInt('chemistsId');

  final description = _i1.ColumnString('description');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        price,
        discountPrice,
        images,
        chemistsId,
        description,
      ];
}

@Deprecated('Use MedicineTable.t instead.')
MedicineTable tMedicine = MedicineTable();
