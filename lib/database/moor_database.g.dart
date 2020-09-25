// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Fav extends DataClass implements Insertable<Fav> {
  final int id;
  final Bank bank;
  Fav({@required this.id, @required this.bank});
  factory Fav.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Fav(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      bank: $FavsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}bank'])),
    );
  }
  factory Fav.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Fav(
      id: serializer.fromJson<int>(json['id']),
      bank: serializer.fromJson<Bank>(json['bank']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'bank': serializer.toJson<Bank>(bank),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Fav>>(bool nullToAbsent) {
    return FavsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      bank: bank == null && nullToAbsent ? const Value.absent() : Value(bank),
    ) as T;
  }

  Fav copyWith({int id, Bank bank}) => Fav(
        id: id ?? this.id,
        bank: bank ?? this.bank,
      );
  @override
  String toString() {
    return (StringBuffer('Fav(')
          ..write('id: $id, ')
          ..write('bank: $bank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, bank.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Fav && other.id == id && other.bank == bank);
}

class FavsCompanion extends UpdateCompanion<Fav> {
  final Value<int> id;
  final Value<Bank> bank;
  const FavsCompanion({
    this.id = const Value.absent(),
    this.bank = const Value.absent(),
  });
  FavsCompanion copyWith({Value<int> id, Value<Bank> bank}) {
    return FavsCompanion(
      id: id ?? this.id,
      bank: bank ?? this.bank,
    );
  }
}

class $FavsTable extends Favs with TableInfo<$FavsTable, Fav> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bankMeta = const VerificationMeta('bank');
  GeneratedTextColumn _bank;
  @override
  GeneratedTextColumn get bank => _bank ??= _constructBank();
  GeneratedTextColumn _constructBank() {
    return GeneratedTextColumn(
      'bank',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, bank];
  @override
  $FavsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favs';
  @override
  final String actualTableName = 'favs';
  @override
  VerificationContext validateIntegrity(FavsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    context.handle(_bankMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fav map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Fav.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.bank.present) {
      final converter = $FavsTable.$converter0;
      map['bank'] =
          Variable<String, StringType>(converter.mapToSql(d.bank.value));
    }
    return map;
  }

  @override
  $FavsTable createAlias(String alias) {
    return $FavsTable(_db, alias);
  }

  static CustomConverter $converter0 = const CustomConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $FavsTable _favs;
  $FavsTable get favs => _favs ??= $FavsTable(this);
  @override
  List<TableInfo> get allTables => [favs];
}
