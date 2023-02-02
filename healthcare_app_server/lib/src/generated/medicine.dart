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
    required this.images,
    this.description,
    this.therapeuticArea,
    this.activeSubstance,
    this.atcCode,
    this.generic,
    this.condition,
  }) : super(id);

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

  static final t = MedicineTable();

  String name;

  List<String?> images;

  String? description;

  String? therapeuticArea;

  String? activeSubstance;

  String? atcCode;

  String? generic;

  String? condition;

  @override
  String get tableName => 'medicine';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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
      case 'images':
        images = value;
        return;
      case 'description':
        description = value;
        return;
      case 'therapeuticArea':
        therapeuticArea = value;
        return;
      case 'activeSubstance':
        activeSubstance = value;
        return;
      case 'atcCode':
        atcCode = value;
        return;
      case 'generic':
        generic = value;
        return;
      case 'condition':
        condition = value;
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

  final images = _i1.ColumnSerializable('images');

  final description = _i1.ColumnString('description');

  final therapeuticArea = _i1.ColumnString('therapeuticArea');

  final activeSubstance = _i1.ColumnString('activeSubstance');

  final atcCode = _i1.ColumnString('atcCode');

  final generic = _i1.ColumnString('generic');

  final condition = _i1.ColumnString('condition');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        images,
        description,
        therapeuticArea,
        activeSubstance,
        atcCode,
        generic,
        condition,
      ];
}

@Deprecated('Use MedicineTable.t instead.')
MedicineTable tMedicine = MedicineTable();
