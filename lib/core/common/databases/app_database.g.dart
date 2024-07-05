// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TransactionStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TransactionStatus>($CategoriesTable.$converterstatus);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumnWithTypeConverter<IconData, String> icon =
      GeneratedColumn<String>('icon', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<IconData>($CategoriesTable.$convertericon);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, totalAmount, color, status, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_iconMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      status: $CategoriesTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      icon: $CategoriesTable.$convertericon.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionStatus, int, int> $converterstatus =
      const EnumIndexConverter<TransactionStatus>(TransactionStatus.values);
  static TypeConverter<IconData, String> $convertericon =
      const IconDataSQLConverter();
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String? title;
  final double totalAmount;
  final int color;
  final TransactionStatus status;

  /// `icon` has a speicial IconDataSQLConverter to map IconData from and to SQL
  final IconData icon;
  const Category(
      {required this.id,
      this.title,
      required this.totalAmount,
      required this.color,
      required this.status,
      required this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['total_amount'] = Variable<double>(totalAmount);
    map['color'] = Variable<int>(color);
    {
      map['status'] =
          Variable<int>($CategoriesTable.$converterstatus.toSql(status));
    }
    {
      map['icon'] =
          Variable<String>($CategoriesTable.$convertericon.toSql(icon));
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      totalAmount: Value(totalAmount),
      color: Value(color),
      status: Value(status),
      icon: Value(icon),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      color: serializer.fromJson<int>(json['color']),
      status: $CategoriesTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      icon: serializer.fromJson<IconData>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'color': serializer.toJson<int>(color),
      'status': serializer
          .toJson<int>($CategoriesTable.$converterstatus.toJson(status)),
      'icon': serializer.toJson<IconData>(icon),
    };
  }

  Category copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          double? totalAmount,
          int? color,
          TransactionStatus? status,
          IconData? icon}) =>
      Category(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        totalAmount: totalAmount ?? this.totalAmount,
        color: color ?? this.color,
        status: status ?? this.status,
        icon: icon ?? this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('color: $color, ')
          ..write('status: $status, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, totalAmount, color, status, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.title == this.title &&
          other.totalAmount == this.totalAmount &&
          other.color == this.color &&
          other.status == this.status &&
          other.icon == this.icon);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String?> title;
  final Value<double> totalAmount;
  final Value<int> color;
  final Value<TransactionStatus> status;
  final Value<IconData> icon;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.color = const Value.absent(),
    this.status = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.totalAmount = const Value.absent(),
    required int color,
    required TransactionStatus status,
    required IconData icon,
  })  : color = Value(color),
        status = Value(status),
        icon = Value(icon);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? totalAmount,
    Expression<int>? color,
    Expression<int>? status,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (color != null) 'color': color,
      if (status != null) 'status': status,
      if (icon != null) 'icon': icon,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<double>? totalAmount,
      Value<int>? color,
      Value<TransactionStatus>? status,
      Value<IconData>? icon}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      totalAmount: totalAmount ?? this.totalAmount,
      color: color ?? this.color,
      status: status ?? this.status,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (status.present) {
      map['status'] =
          Variable<int>($CategoriesTable.$converterstatus.toSql(status.value));
    }
    if (icon.present) {
      map['icon'] =
          Variable<String>($CategoriesTable.$convertericon.toSql(icon.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('color: $color, ')
          ..write('status: $status, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
      'datetime', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, note, amount, datetime, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datetime']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String? note;
  final double amount;
  final DateTime? datetime;
  final int category;
  const Transaction(
      {required this.id,
      this.note,
      required this.amount,
      this.datetime,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || datetime != null) {
      map['datetime'] = Variable<DateTime>(datetime);
    }
    map['category'] = Variable<int>(category);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      amount: Value(amount),
      datetime: datetime == null && nullToAbsent
          ? const Value.absent()
          : Value(datetime),
      category: Value(category),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      note: serializer.fromJson<String?>(json['note']),
      amount: serializer.fromJson<double>(json['amount']),
      datetime: serializer.fromJson<DateTime?>(json['datetime']),
      category: serializer.fromJson<int>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'note': serializer.toJson<String?>(note),
      'amount': serializer.toJson<double>(amount),
      'datetime': serializer.toJson<DateTime?>(datetime),
      'category': serializer.toJson<int>(category),
    };
  }

  Transaction copyWith(
          {int? id,
          Value<String?> note = const Value.absent(),
          double? amount,
          Value<DateTime?> datetime = const Value.absent(),
          int? category}) =>
      Transaction(
        id: id ?? this.id,
        note: note.present ? note.value : this.note,
        amount: amount ?? this.amount,
        datetime: datetime.present ? datetime.value : this.datetime,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('note: $note, ')
          ..write('amount: $amount, ')
          ..write('datetime: $datetime, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, note, amount, datetime, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.note == this.note &&
          other.amount == this.amount &&
          other.datetime == this.datetime &&
          other.category == this.category);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String?> note;
  final Value<double> amount;
  final Value<DateTime?> datetime;
  final Value<int> category;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.note = const Value.absent(),
    this.amount = const Value.absent(),
    this.datetime = const Value.absent(),
    this.category = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.note = const Value.absent(),
    required double amount,
    this.datetime = const Value.absent(),
    required int category,
  })  : amount = Value(amount),
        category = Value(category);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? note,
    Expression<double>? amount,
    Expression<DateTime>? datetime,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (note != null) 'note': note,
      if (amount != null) 'amount': amount,
      if (datetime != null) 'datetime': datetime,
      if (category != null) 'category': category,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? note,
      Value<double>? amount,
      Value<DateTime?>? datetime,
      Value<int>? category}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      note: note ?? this.note,
      amount: amount ?? this.amount,
      datetime: datetime ?? this.datetime,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('note: $note, ')
          ..write('amount: $amount, ')
          ..write('datetime: $datetime, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final Index transactionsId = Index(
      'transactions_id', 'CREATE INDEX transactions_id ON transactions (id)');
  late final Index categoriesId =
      Index('categories_id', 'CREATE INDEX categories_id ON categories (id)');
  late final TransactionsDao transactionsDao =
      TransactionsDao(this as AppDatabase);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, transactions, transactionsId, categoriesId];
}

typedef $$CategoriesTableInsertCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String?> title,
  Value<double> totalAmount,
  required int color,
  required TransactionStatus status,
  required IconData icon,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String?> title,
  Value<double> totalAmount,
  Value<int> color,
  Value<TransactionStatus> status,
  Value<IconData> icon,
});

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<TransactionStatus> status = const Value.absent(),
            Value<IconData> icon = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            title: title,
            totalAmount: totalAmount,
            color: color,
            status: status,
            icon: icon,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            required int color,
            required TransactionStatus status,
            required IconData icon,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            title: title,
            totalAmount: totalAmount,
            color: color,
            status: status,
            icon: icon,
          ),
        ));
}

class $$CategoriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableProcessedTableManager(super.$state);
}

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalAmount => $state.composableBuilder(
      column: $state.table.totalAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<TransactionStatus, TransactionStatus, int>
      get status => $state.composableBuilder(
          column: $state.table.status,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<IconData, IconData, String> get icon =>
      $state.composableBuilder(
          column: $state.table.icon,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter transactionsRefs(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalAmount => $state.composableBuilder(
      column: $state.table.totalAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TransactionsTableInsertCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> note,
  required double amount,
  Value<DateTime?> datetime,
  required int category,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> note,
  Value<double> amount,
  Value<DateTime?> datetime,
  Value<int> category,
});

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableProcessedTableManager,
    $$TransactionsTableInsertCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TransactionsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime?> datetime = const Value.absent(),
            Value<int> category = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            note: note,
            amount: amount,
            datetime: datetime,
            category: category,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required double amount,
            Value<DateTime?> datetime = const Value.absent(),
            required int category,
          }) =>
              TransactionsCompanion.insert(
            id: id,
            note: note,
            amount: amount,
            datetime: datetime,
            category: category,
          ),
        ));
}

class $$TransactionsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableProcessedTableManager,
    $$TransactionsTableInsertCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder> {
  $$TransactionsTableProcessedTableManager(super.$state);
}

class $$TransactionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get datetime => $state.composableBuilder(
      column: $state.table.datetime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoriesTableFilterComposer get category {
    final $$CategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get datetime => $state.composableBuilder(
      column: $state.table.datetime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoriesTableOrderingComposer get category {
    final $$CategoriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableOrderingComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
