// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHydrationSettingsCollection on Isar {
  IsarCollection<HydrationSettings> get hydrationSettings => this.collection();
}

const HydrationSettingsSchema = CollectionSchema(
  name: r'HydrationSettings',
  id: 3149909576759420414,
  properties: {
    r'baseGoalMl': PropertySchema(
      id: 0,
      name: r'baseGoalMl',
      type: IsarType.long,
    ),
    r'isCustomGoal': PropertySchema(
      id: 1,
      name: r'isCustomGoal',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 2,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _hydrationSettingsEstimateSize,
  serialize: _hydrationSettingsSerialize,
  deserialize: _hydrationSettingsDeserialize,
  deserializeProp: _hydrationSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _hydrationSettingsGetId,
  getLinks: _hydrationSettingsGetLinks,
  attach: _hydrationSettingsAttach,
  version: '3.1.0+1',
);

int _hydrationSettingsEstimateSize(
  HydrationSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _hydrationSettingsSerialize(
  HydrationSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.baseGoalMl);
  writer.writeBool(offsets[1], object.isCustomGoal);
  writer.writeDateTime(offsets[2], object.updatedAt);
}

HydrationSettings _hydrationSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HydrationSettings();
  object.baseGoalMl = reader.readLong(offsets[0]);
  object.id = id;
  object.isCustomGoal = reader.readBool(offsets[1]);
  object.updatedAt = reader.readDateTime(offsets[2]);
  return object;
}

P _hydrationSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hydrationSettingsGetId(HydrationSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hydrationSettingsGetLinks(
    HydrationSettings object) {
  return [];
}

void _hydrationSettingsAttach(
    IsarCollection<dynamic> col, Id id, HydrationSettings object) {
  object.id = id;
}

extension HydrationSettingsQueryWhereSort
    on QueryBuilder<HydrationSettings, HydrationSettings, QWhere> {
  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HydrationSettingsQueryWhere
    on QueryBuilder<HydrationSettings, HydrationSettings, QWhereClause> {
  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterWhereClause>
      idBetween(
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
}

extension HydrationSettingsQueryFilter
    on QueryBuilder<HydrationSettings, HydrationSettings, QFilterCondition> {
  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      baseGoalMlEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseGoalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      baseGoalMlGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseGoalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      baseGoalMlLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseGoalMl',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      baseGoalMlBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseGoalMl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      isCustomGoalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
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

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterFilterCondition>
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

extension HydrationSettingsQueryObject
    on QueryBuilder<HydrationSettings, HydrationSettings, QFilterCondition> {}

extension HydrationSettingsQueryLinks
    on QueryBuilder<HydrationSettings, HydrationSettings, QFilterCondition> {}

extension HydrationSettingsQuerySortBy
    on QueryBuilder<HydrationSettings, HydrationSettings, QSortBy> {
  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByBaseGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseGoalMl', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByBaseGoalMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseGoalMl', Sort.desc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByIsCustomGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomGoal', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByIsCustomGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomGoal', Sort.desc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HydrationSettingsQuerySortThenBy
    on QueryBuilder<HydrationSettings, HydrationSettings, QSortThenBy> {
  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByBaseGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseGoalMl', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByBaseGoalMlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseGoalMl', Sort.desc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByIsCustomGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomGoal', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByIsCustomGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomGoal', Sort.desc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HydrationSettingsQueryWhereDistinct
    on QueryBuilder<HydrationSettings, HydrationSettings, QDistinct> {
  QueryBuilder<HydrationSettings, HydrationSettings, QDistinct>
      distinctByBaseGoalMl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseGoalMl');
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QDistinct>
      distinctByIsCustomGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustomGoal');
    });
  }

  QueryBuilder<HydrationSettings, HydrationSettings, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension HydrationSettingsQueryProperty
    on QueryBuilder<HydrationSettings, HydrationSettings, QQueryProperty> {
  QueryBuilder<HydrationSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HydrationSettings, int, QQueryOperations> baseGoalMlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseGoalMl');
    });
  }

  QueryBuilder<HydrationSettings, bool, QQueryOperations>
      isCustomGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustomGoal');
    });
  }

  QueryBuilder<HydrationSettings, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
