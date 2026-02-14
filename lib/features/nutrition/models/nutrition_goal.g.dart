// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_goal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionGoalCollection on Isar {
  IsarCollection<NutritionGoal> get nutritionGoals => this.collection();
}

const NutritionGoalSchema = CollectionSchema(
  name: r'NutritionGoal',
  id: -6176738821382431484,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'source': PropertySchema(
      id: 2,
      name: r'source',
      type: IsarType.string,
    ),
    r'targetCalories': PropertySchema(
      id: 3,
      name: r'targetCalories',
      type: IsarType.long,
    ),
    r'targetCarbsG': PropertySchema(
      id: 4,
      name: r'targetCarbsG',
      type: IsarType.long,
    ),
    r'targetFatsG': PropertySchema(
      id: 5,
      name: r'targetFatsG',
      type: IsarType.long,
    ),
    r'targetProteinG': PropertySchema(
      id: 6,
      name: r'targetProteinG',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _nutritionGoalEstimateSize,
  serialize: _nutritionGoalSerialize,
  deserialize: _nutritionGoalDeserialize,
  deserializeProp: _nutritionGoalDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nutritionGoalGetId,
  getLinks: _nutritionGoalGetLinks,
  attach: _nutritionGoalAttach,
  version: '3.1.0+1',
);

int _nutritionGoalEstimateSize(
  NutritionGoal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nutritionGoalSerialize(
  NutritionGoal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.source);
  writer.writeLong(offsets[3], object.targetCalories);
  writer.writeLong(offsets[4], object.targetCarbsG);
  writer.writeLong(offsets[5], object.targetFatsG);
  writer.writeLong(offsets[6], object.targetProteinG);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

NutritionGoal _nutritionGoalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionGoal();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.source = reader.readStringOrNull(offsets[2]);
  object.targetCalories = reader.readLong(offsets[3]);
  object.targetCarbsG = reader.readLong(offsets[4]);
  object.targetFatsG = reader.readLong(offsets[5]);
  object.targetProteinG = reader.readLong(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _nutritionGoalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionGoalGetId(NutritionGoal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionGoalGetLinks(NutritionGoal object) {
  return [];
}

void _nutritionGoalAttach(
    IsarCollection<dynamic> col, Id id, NutritionGoal object) {
  object.id = id;
}

extension NutritionGoalByIndex on IsarCollection<NutritionGoal> {
  Future<NutritionGoal?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  NutritionGoal? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<NutritionGoal?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<NutritionGoal?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(NutritionGoal object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(NutritionGoal object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<NutritionGoal> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<NutritionGoal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension NutritionGoalQueryWhereSort
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhere> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension NutritionGoalQueryWhere
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhereClause> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idBetween(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NutritionGoalQueryFilter
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbsGEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCarbsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbsGGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCarbsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbsGLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCarbsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetCarbsGBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCarbsG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatsGEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFatsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatsGGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFatsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatsGLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFatsG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetFatsGBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFatsG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinGEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetProteinG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinGGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetProteinG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinGLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetProteinG',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      targetProteinGBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetProteinG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

extension NutritionGoalQueryObject
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQueryLinks
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQuerySortBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCarbsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbsG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetCarbsGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbsG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTargetFatsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFatsG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetFatsGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFatsG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetProteinG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProteinG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByTargetProteinGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProteinG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NutritionGoalQuerySortThenBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortThenBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCarbsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbsG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetCarbsGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarbsG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTargetFatsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFatsG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetFatsGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFatsG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetProteinG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProteinG', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByTargetProteinGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProteinG', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NutritionGoalQueryWhereDistinct
    on QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> {
  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetCarbsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCarbsG');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetFatsG() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFatsG');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByTargetProteinG() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetProteinG');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension NutritionGoalQueryProperty
    on QueryBuilder<NutritionGoal, NutritionGoal, QQueryProperty> {
  QueryBuilder<NutritionGoal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NutritionGoal, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NutritionGoal, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<NutritionGoal, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalories');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetCarbsGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCarbsG');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetFatsGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFatsG');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> targetProteinGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetProteinG');
    });
  }

  QueryBuilder<NutritionGoal, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
