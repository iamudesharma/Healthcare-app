/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Chemists extends _i1.TableRow {
  Chemists({
    int? id,
    required this.name,
    this.address,
    this.geoPoint,
    this.images,
    this.openTime,
    this.closeTime,
    this.email,
    this.phoneNo,
    required this.userId,
    this.latitude,
    this.longitude,
    this.invertory,
  }) : super(id);

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
          .deserialize<String?>(jsonSerialization['images']),
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
      invertory: serializationManager
          .deserialize<List<_i2.Inventory?>?>(jsonSerialization['invertory']),
    );
  }

  static final t = ChemistsTable();

  String name;

  String? address;

  _i2.GeoPoint? geoPoint;

  String? images;

  DateTime? openTime;

  DateTime? closeTime;

  String? email;

  int? phoneNo;

  int userId;

  double? latitude;

  double? longitude;

  List<_i2.Inventory?>? invertory;

  @override
  String get tableName => 'chemists';
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
      'invertory': invertory,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
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
      'invertory': invertory,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      'invertory': invertory,
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
      case 'address':
        address = value;
        return;
      case 'geoPoint':
        geoPoint = value;
        return;
      case 'images':
        images = value;
        return;
      case 'openTime':
        openTime = value;
        return;
      case 'closeTime':
        closeTime = value;
        return;
      case 'email':
        email = value;
        return;
      case 'phoneNo':
        phoneNo = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'latitude':
        latitude = value;
        return;
      case 'longitude':
        longitude = value;
        return;
      case 'invertory':
        invertory = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Chemists>> find(
    _i1.Session session, {
    ChemistsExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Chemists>(
      where: where != null ? where(Chemists.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Chemists?> findSingleRow(
    _i1.Session session, {
    ChemistsExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Chemists>(
      where: where != null ? where(Chemists.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Chemists?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Chemists>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ChemistsExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Chemists>(
      where: where(Chemists.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Chemists row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Chemists row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Chemists row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ChemistsExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Chemists>(
      where: where != null ? where(Chemists.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ChemistsExpressionBuilder = _i1.Expression Function(ChemistsTable);

class ChemistsTable extends _i1.Table {
  ChemistsTable() : super(tableName: 'chemists');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final address = _i1.ColumnString('address');

  final geoPoint = _i1.ColumnSerializable('geoPoint');

  final images = _i1.ColumnString('images');

  final openTime = _i1.ColumnDateTime('openTime');

  final closeTime = _i1.ColumnDateTime('closeTime');

  final email = _i1.ColumnString('email');

  final phoneNo = _i1.ColumnInt('phoneNo');

  final userId = _i1.ColumnInt('userId');

  final latitude = _i1.ColumnDouble('latitude');

  final longitude = _i1.ColumnDouble('longitude');

  final invertory = _i1.ColumnSerializable('invertory');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        address,
        geoPoint,
        images,
        openTime,
        closeTime,
        email,
        phoneNo,
        userId,
        latitude,
        longitude,
        invertory,
      ];
}

@Deprecated('Use ChemistsTable.t instead.')
ChemistsTable tChemists = ChemistsTable();
