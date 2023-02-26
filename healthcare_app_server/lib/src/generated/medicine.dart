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
    this.name,
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
  }) : super(id);

  factory Medicine.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Medicine(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
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

  static final t = MedicineTable();

  String? name;

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
  String get tableName => 'medicine';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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
      case 'category':
        category = value;
        return;
      case 'description':
        description = value;
        return;
      case 'subCategory':
        subCategory = value;
        return;
      case 'idCode':
        idCode = value;
        return;
      case 'image':
        image = value;
        return;
      case 'manufactures':
        manufactures = value;
        return;
      case 'packaging':
        packaging = value;
        return;
      case 'pack_info':
        pack_info = value;
        return;
      case 'introduction':
        introduction = value;
        return;
      case 'benefits':
        benefits = value;
        return;
      case 'howToUse':
        howToUse = value;
        return;
      case 'safetyAdvise':
        safetyAdvise = value;
        return;
      case 'ingredients':
        ingredients = value;
        return;
      case 'manufactureAddress':
        manufactureAddress = value;
        return;
      case 'countryOfOrigin':
        countryOfOrigin = value;
        return;
      case 'medicineType':
        medicineType = value;
        return;
      case 'useOf':
        useOf = value;
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

  final category = _i1.ColumnString('category');

  final description = _i1.ColumnString('description');

  final subCategory = _i1.ColumnString('subCategory');

  final idCode = _i1.ColumnInt('idCode');

  final image = _i1.ColumnString('image');

  final manufactures = _i1.ColumnString('manufactures');

  final packaging = _i1.ColumnString('packaging');

  final pack_info = _i1.ColumnString('pack_info');

  final introduction = _i1.ColumnString('introduction');

  final benefits = _i1.ColumnString('benefits');

  final howToUse = _i1.ColumnString('howToUse');

  final safetyAdvise = _i1.ColumnString('safetyAdvise');

  final ingredients = _i1.ColumnString('ingredients');

  final manufactureAddress = _i1.ColumnString('manufactureAddress');

  final countryOfOrigin = _i1.ColumnString('countryOfOrigin');

  final medicineType = _i1.ColumnString('medicineType');

  final useOf = _i1.ColumnString('useOf');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        category,
        description,
        subCategory,
        idCode,
        image,
        manufactures,
        packaging,
        pack_info,
        introduction,
        benefits,
        howToUse,
        safetyAdvise,
        ingredients,
        manufactureAddress,
        countryOfOrigin,
        medicineType,
        useOf,
      ];
}

@Deprecated('Use MedicineTable.t instead.')
MedicineTable tMedicine = MedicineTable();
