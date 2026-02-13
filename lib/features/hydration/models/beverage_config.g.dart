// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beverage_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBeverageConfigCollection on Isar {
  IsarCollection<BeverageConfig> get beverageConfigs => this.collection();
}

const BeverageConfigSchema = CollectionSchema(
  name: r'BeverageConfig',
  id: -7088461881929515271,
  properties: {
    r'coefficient': PropertySchema(
      id: 0,
      name: r'coefficient',
      type: IsarType.double,
    ),
    r'colorValue': PropertySchema(
      id: 1,
      name: r'colorValue',
      type: IsarType.long,
    ),
    r'iconCodePoint': PropertySchema(
      id: 2,
      name: r'iconCodePoint',
      type: IsarType.long,
    ),
    r'isEnabled': PropertySchema(
      id: 3,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'presetSizes': PropertySchema(
      id: 5,
      name: r'presetSizes',
      type: IsarType.longList,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _beverageConfigEstimateSize,
  serialize: _beverageConfigSerialize,
  deserialize: _beverageConfigDeserialize,
  deserializeProp: _beverageConfigDeserializeProp,
  idName: r'id',
  indexes: {
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _beverageConfigGetId,
  getLinks: _beverageConfigGetLinks,
  attach: _beverageConfigAttach,
  version: '3.1.0+1',
);

int _beverageConfigEstimateSize(
  BeverageConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.presetSizes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _beverageConfigSerialize(
  BeverageConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.coefficient);
  writer.writeLong(offsets[1], object.colorValue);
  writer.writeLong(offsets[2], object.iconCodePoint);
  writer.writeBool(offsets[3], object.isEnabled);
  writer.writeString(offsets[4], object.name);
  writer.writeLongList(offsets[5], object.presetSizes);
  writer.writeString(offsets[6], object.type);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

BeverageConfig _beverageConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BeverageConfig();
  object.coefficient = reader.readDouble(offsets[0]);
  object.colorValue = reader.readLong(offsets[1]);
  object.iconCodePoint = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.isEnabled = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.presetSizes = reader.readLongList(offsets[5]);
  object.type = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _beverageConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongList(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _beverageConfigGetId(BeverageConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _beverageConfigGetLinks(BeverageConfig object) {
  return [];
}

void _beverageConfigAttach(
    IsarCollection<dynamic> col, Id id, BeverageConfig object) {
  object.id = id;
}

extension BeverageConfigByIndex on IsarCollection<BeverageConfig> {
  Future<BeverageConfig?> getByType(String type) {
    return getByIndex(r'type', [type]);
  }

  BeverageConfig? getByTypeSync(String type) {
    return getByIndexSync(r'type', [type]);
  }

  Future<bool> deleteByType(String type) {
    return deleteByIndex(r'type', [type]);
  }

  bool deleteByTypeSync(String type) {
    return deleteByIndexSync(r'type', [type]);
  }

  Future<List<BeverageConfig?>> getAllByType(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return getAllByIndex(r'type', values);
  }

  List<BeverageConfig?> getAllByTypeSync(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'type', values);
  }

  Future<int> deleteAllByType(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'type', values);
  }

  int deleteAllByTypeSync(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'type', values);
  }

  Future<Id> putByType(BeverageConfig object) {
    return putByIndex(r'type', object);
  }

  Id putByTypeSync(BeverageConfig object, {bool saveLinks = true}) {
    return putByIndexSync(r'type', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByType(List<BeverageConfig> objects) {
    return putAllByIndex(r'type', objects);
  }

  List<Id> putAllByTypeSync(List<BeverageConfig> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'type', objects, saveLinks: saveLinks);
  }
}

extension BeverageConfigQueryWhereSort
    on QueryBuilder<BeverageConfig, BeverageConfig, QWhere> {
  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BeverageConfigQueryWhere
    on QueryBuilder<BeverageConfig, BeverageConfig, QWhereClause> {
  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause> typeEqualTo(
      String type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type',
        value: [type],
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterWhereClause>
      typeNotEqualTo(String type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BeverageConfigQueryFilter
    on QueryBuilder<BeverageConfig, BeverageConfig, QFilterCondition> {
  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      coefficientEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      coefficientGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      coefficientLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      coefficientBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coefficient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      colorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      colorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      colorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      colorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconCodePoint',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconCodePoint',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCodePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconCodePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconCodePoint',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      iconCodePointBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconCodePoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      isEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'presetSizes',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'presetSizes',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'presetSizes',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'presetSizes',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'presetSizes',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'presetSizes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      presetSizesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'presetSizes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BeverageConfigQueryObject
    on QueryBuilder<BeverageConfig, BeverageConfig, QFilterCondition> {}

extension BeverageConfigQueryLinks
    on QueryBuilder<BeverageConfig, BeverageConfig, QFilterCondition> {}

extension BeverageConfigQuerySortBy
    on QueryBuilder<BeverageConfig, BeverageConfig, QSortBy> {
  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByIconCodePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BeverageConfigQuerySortThenBy
    on QueryBuilder<BeverageConfig, BeverageConfig, QSortThenBy> {
  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByIconCodePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BeverageConfigQueryWhereDistinct
    on QueryBuilder<BeverageConfig, BeverageConfig, QDistinct> {
  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coefficient');
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorValue');
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconCodePoint');
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByPresetSizes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'presetSizes');
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BeverageConfig, BeverageConfig, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BeverageConfigQueryProperty
    on QueryBuilder<BeverageConfig, BeverageConfig, QQueryProperty> {
  QueryBuilder<BeverageConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BeverageConfig, double, QQueryOperations> coefficientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coefficient');
    });
  }

  QueryBuilder<BeverageConfig, int, QQueryOperations> colorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorValue');
    });
  }

  QueryBuilder<BeverageConfig, int?, QQueryOperations> iconCodePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconCodePoint');
    });
  }

  QueryBuilder<BeverageConfig, bool, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<BeverageConfig, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BeverageConfig, List<int>?, QQueryOperations>
      presetSizesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'presetSizes');
    });
  }

  QueryBuilder<BeverageConfig, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BeverageConfig, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
