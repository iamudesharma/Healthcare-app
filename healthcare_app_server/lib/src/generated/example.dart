/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/module.dart' as _i2;

class Example extends _i1.TableRow {
  Example({
    int? id,
    required this.name,
    required this.data,
    required this.userInfo,
  }) : super(id);

  factory Example.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Example(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      data: serializationManager.deserialize<int>(jsonSerialization['data']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo>(jsonSerialization['userInfo']),
    );
  }

  static final t = ExampleTable();

  String name;

  int data;

  _i2.UserInfo userInfo;

  @override
  String get tableName => 'example';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data,
      'userInfo': userInfo,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'data': data,
      'userInfo': userInfo,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'data': data,
      'userInfo': userInfo,
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
      case 'data':
        data = value;
        return;
      case 'userInfo':
        userInfo = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Example>> find(
    _i1.Session session, {
    ExampleExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Example>(
      where: where != null ? where(Example.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Example?> findSingleRow(
    _i1.Session session, {
    ExampleExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Example>(
      where: where != null ? where(Example.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Example?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Example>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ExampleExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Example>(
      where: where(Example.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ExampleExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Example>(
      where: where != null ? where(Example.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ExampleExpressionBuilder = _i1.Expression Function(ExampleTable);

class ExampleTable extends _i1.Table {
  ExampleTable() : super(tableName: 'example');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final data = _i1.ColumnInt('data');

  final userInfo = _i1.ColumnSerializable('userInfo');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        data,
        userInfo,
      ];
}

@Deprecated('Use ExampleTable.t instead.')
ExampleTable tExample = ExampleTable();
