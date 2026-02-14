// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodItemCollection on Isar {
  IsarCollection<FoodItem> get foodItems => this.collection();
}

const FoodItemSchema = CollectionSchema(
  name: r'FoodItem',
  id: 8311037358550475404,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'caloriesPer100g': PropertySchema(
      id: 1,
      name: r'caloriesPer100g',
      type: IsarType.double,
    ),
    r'carbsPer100g': PropertySchema(
      id: 2,
      name: r'carbsPer100g',
      type: IsarType.double,
    ),
    r'category': PropertySchema(
      id: 3,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'fatsPer100g': PropertySchema(
      id: 5,
      name: r'fatsPer100g',
      type: IsarType.double,
    ),
    r'fiberPer100g': PropertySchema(
      id: 6,
      name: r'fiberPer100g',
      type: IsarType.double,
    ),
    r'foodId': PropertySchema(
      id: 7,
      name: r'foodId',
      type: IsarType.string,
    ),
    r'isCustom': PropertySchema(
      id: 8,
      name: r'isCustom',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 9,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'proteinPer100g': PropertySchema(
      id: 11,
      name: r'proteinPer100g',
      type: IsarType.double,
    ),
    r'servingSizeGrams': PropertySchema(
      id: 12,
      name: r'servingSizeGrams',
      type: IsarType.double,
    ),
    r'servingUnit': PropertySchema(
      id: 13,
      name: r'servingUnit',
      type: IsarType.string,
    ),
    r'sugarPer100g': PropertySchema(
      id: 14,
      name: r'sugarPer100g',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _foodItemEstimateSize,
  serialize: _foodItemSerialize,
  deserialize: _foodItemDeserialize,
  deserializeProp: _foodItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'foodId': IndexSchema(
      id: 6823679418906861405,
      name: r'foodId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'foodId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'category': IndexSchema(
      id: -7560358558326323820,
      name: r'category',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'category',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _foodItemGetId,
  getLinks: _foodItemGetLinks,
  attach: _foodItemAttach,
  version: '3.1.0+1',
);

int _foodItemEstimateSize(
  FoodItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.foodId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.servingUnit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _foodItemSerialize(
  FoodItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeDouble(offsets[1], object.caloriesPer100g);
  writer.writeDouble(offsets[2], object.carbsPer100g);
  writer.writeString(offsets[3], object.category);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDouble(offsets[5], object.fatsPer100g);
  writer.writeDouble(offsets[6], object.fiberPer100g);
  writer.writeString(offsets[7], object.foodId);
  writer.writeBool(offsets[8], object.isCustom);
  writer.writeBool(offsets[9], object.isFavorite);
  writer.writeString(offsets[10], object.name);
  writer.writeDouble(offsets[11], object.proteinPer100g);
  writer.writeDouble(offsets[12], object.servingSizeGrams);
  writer.writeString(offsets[13], object.servingUnit);
  writer.writeDouble(offsets[14], object.sugarPer100g);
  writer.writeDateTime(offsets[15], object.updatedAt);
}

FoodItem _foodItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodItem();
  object.brand = reader.readStringOrNull(offsets[0]);
  object.caloriesPer100g = reader.readDouble(offsets[1]);
  object.carbsPer100g = reader.readDouble(offsets[2]);
  object.category = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.fatsPer100g = reader.readDouble(offsets[5]);
  object.fiberPer100g = reader.readDoubleOrNull(offsets[6]);
  object.foodId = reader.readString(offsets[7]);
  object.id = id;
  object.isCustom = reader.readBool(offsets[8]);
  object.isFavorite = reader.readBool(offsets[9]);
  object.name = reader.readString(offsets[10]);
  object.proteinPer100g = reader.readDouble(offsets[11]);
  object.servingSizeGrams = reader.readDoubleOrNull(offsets[12]);
  object.servingUnit = reader.readStringOrNull(offsets[13]);
  object.sugarPer100g = reader.readDoubleOrNull(offsets[14]);
  object.updatedAt = reader.readDateTime(offsets[15]);
  return object;
}

P _foodItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodItemGetId(FoodItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodItemGetLinks(FoodItem object) {
  return [];
}

void _foodItemAttach(IsarCollection<dynamic> col, Id id, FoodItem object) {
  object.id = id;
}

extension FoodItemByIndex on IsarCollection<FoodItem> {
  Future<FoodItem?> getByFoodId(String foodId) {
    return getByIndex(r'foodId', [foodId]);
  }

  FoodItem? getByFoodIdSync(String foodId) {
    return getByIndexSync(r'foodId', [foodId]);
  }

  Future<bool> deleteByFoodId(String foodId) {
    return deleteByIndex(r'foodId', [foodId]);
  }

  bool deleteByFoodIdSync(String foodId) {
    return deleteByIndexSync(r'foodId', [foodId]);
  }

  Future<List<FoodItem?>> getAllByFoodId(List<String> foodIdValues) {
    final values = foodIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'foodId', values);
  }

  List<FoodItem?> getAllByFoodIdSync(List<String> foodIdValues) {
    final values = foodIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'foodId', values);
  }

  Future<int> deleteAllByFoodId(List<String> foodIdValues) {
    final values = foodIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'foodId', values);
  }

  int deleteAllByFoodIdSync(List<String> foodIdValues) {
    final values = foodIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'foodId', values);
  }

  Future<Id> putByFoodId(FoodItem object) {
    return putByIndex(r'foodId', object);
  }

  Id putByFoodIdSync(FoodItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'foodId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFoodId(List<FoodItem> objects) {
    return putAllByIndex(r'foodId', objects);
  }

  List<Id> putAllByFoodIdSync(List<FoodItem> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'foodId', objects, saveLinks: saveLinks);
  }
}

extension FoodItemQueryWhereSort on QueryBuilder<FoodItem, FoodItem, QWhere> {
  QueryBuilder<FoodItem, FoodItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodItemQueryWhere on QueryBuilder<FoodItem, FoodItem, QWhereClause> {
  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodIdEqualTo(
      String foodId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'foodId',
        value: [foodId],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodIdNotEqualTo(
      String foodId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodId',
              lower: [],
              upper: [foodId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodId',
              lower: [foodId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodId',
              lower: [foodId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodId',
              lower: [],
              upper: [foodId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> categoryEqualTo(
      String category) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category',
        value: [category],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> categoryNotEqualTo(
      String category) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [],
              upper: [category],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [category],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [category],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [],
              upper: [category],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FoodItemQueryFilter
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {
  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      caloriesPer100gEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caloriesPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      caloriesPer100gGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caloriesPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      caloriesPer100gLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caloriesPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      caloriesPer100gBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caloriesPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbsPer100gEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      carbsPer100gGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbsPer100gLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbsPer100gBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbsPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsPer100gEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      fatsPer100gGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsPer100gLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatsPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsPer100gBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatsPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fiberPer100gIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fiberPer100g',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      fiberPer100gIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fiberPer100g',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fiberPer100gEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiberPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      fiberPer100gGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiberPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fiberPer100gLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiberPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fiberPer100gBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiberPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> isCustomEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustom',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinPer100gEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proteinPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      proteinPer100gGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proteinPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      proteinPer100gLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proteinPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinPer100gBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proteinPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'servingSizeGrams',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'servingSizeGrams',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servingSizeGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servingSizeGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servingSizeGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingSizeGramsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servingSizeGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'servingUnit',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'servingUnit',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingUnitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servingUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'servingUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'servingUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> servingUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servingUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      servingUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'servingUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> sugarPer100gIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sugarPer100g',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      sugarPer100gIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sugarPer100g',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> sugarPer100gEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sugarPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      sugarPer100gGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sugarPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> sugarPer100gLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sugarPer100g',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> sugarPer100gBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sugarPer100g',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> updatedAtBetween(
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

extension FoodItemQueryObject
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {}

extension FoodItemQueryLinks
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {}

extension FoodItemQuerySortBy on QueryBuilder<FoodItem, FoodItem, QSortBy> {
  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCaloriesPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCaloriesPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCarbsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCarbsPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFatsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFatsPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFiberPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiberPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFiberPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiberPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByProteinPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByProteinPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByServingSizeGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingSizeGrams', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByServingSizeGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingSizeGrams', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByServingUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByServingUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingUnit', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortBySugarPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugarPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortBySugarPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugarPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FoodItemQuerySortThenBy
    on QueryBuilder<FoodItem, FoodItem, QSortThenBy> {
  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCaloriesPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCaloriesPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCarbsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCarbsPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFatsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFatsPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFiberPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiberPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFiberPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiberPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByProteinPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByProteinPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByServingSizeGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingSizeGrams', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByServingSizeGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingSizeGrams', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByServingUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByServingUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingUnit', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenBySugarPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugarPer100g', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenBySugarPer100gDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sugarPer100g', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FoodItemQueryWhereDistinct
    on QueryBuilder<FoodItem, FoodItem, QDistinct> {
  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCaloriesPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caloriesPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCarbsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbsPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFatsPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatsPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFiberPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiberPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFoodId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustom');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByProteinPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteinPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByServingSizeGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servingSizeGrams');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByServingUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servingUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctBySugarPer100g() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sugarPer100g');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension FoodItemQueryProperty
    on QueryBuilder<FoodItem, FoodItem, QQueryProperty> {
  QueryBuilder<FoodItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodItem, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<FoodItem, double, QQueryOperations> caloriesPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caloriesPer100g');
    });
  }

  QueryBuilder<FoodItem, double, QQueryOperations> carbsPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbsPer100g');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<FoodItem, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FoodItem, double, QQueryOperations> fatsPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatsPer100g');
    });
  }

  QueryBuilder<FoodItem, double?, QQueryOperations> fiberPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiberPer100g');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> foodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodId');
    });
  }

  QueryBuilder<FoodItem, bool, QQueryOperations> isCustomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustom');
    });
  }

  QueryBuilder<FoodItem, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FoodItem, double, QQueryOperations> proteinPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteinPer100g');
    });
  }

  QueryBuilder<FoodItem, double?, QQueryOperations> servingSizeGramsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servingSizeGrams');
    });
  }

  QueryBuilder<FoodItem, String?, QQueryOperations> servingUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servingUnit');
    });
  }

  QueryBuilder<FoodItem, double?, QQueryOperations> sugarPer100gProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sugarPer100g');
    });
  }

  QueryBuilder<FoodItem, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
