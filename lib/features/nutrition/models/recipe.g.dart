// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecipeCollection on Isar {
  IsarCollection<Recipe> get recipes => this.collection();
}

const RecipeSchema = CollectionSchema(
  name: r'Recipe',
  id: 8054415271972849591,
  properties: {
    r'caloriesPerServing': PropertySchema(
      id: 0,
      name: r'caloriesPerServing',
      type: IsarType.double,
    ),
    r'carbsPerServing': PropertySchema(
      id: 1,
      name: r'carbsPerServing',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'fatsPerServing': PropertySchema(
      id: 4,
      name: r'fatsPerServing',
      type: IsarType.double,
    ),
    r'imageUrl': PropertySchema(
      id: 5,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'ingredientAmounts': PropertySchema(
      id: 6,
      name: r'ingredientAmounts',
      type: IsarType.doubleList,
    ),
    r'ingredientFoodIds': PropertySchema(
      id: 7,
      name: r'ingredientFoodIds',
      type: IsarType.stringList,
    ),
    r'ingredientNames': PropertySchema(
      id: 8,
      name: r'ingredientNames',
      type: IsarType.stringList,
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
    r'preparationSteps': PropertySchema(
      id: 11,
      name: r'preparationSteps',
      type: IsarType.stringList,
    ),
    r'proteinPerServing': PropertySchema(
      id: 12,
      name: r'proteinPerServing',
      type: IsarType.double,
    ),
    r'servings': PropertySchema(
      id: 13,
      name: r'servings',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 14,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'totalCalories': PropertySchema(
      id: 15,
      name: r'totalCalories',
      type: IsarType.double,
    ),
    r'totalCarbs': PropertySchema(
      id: 16,
      name: r'totalCarbs',
      type: IsarType.double,
    ),
    r'totalFats': PropertySchema(
      id: 17,
      name: r'totalFats',
      type: IsarType.double,
    ),
    r'totalProtein': PropertySchema(
      id: 18,
      name: r'totalProtein',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _recipeEstimateSize,
  serialize: _recipeSerialize,
  deserialize: _recipeDeserialize,
  deserializeProp: _recipeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recipeGetId,
  getLinks: _recipeGetLinks,
  attach: _recipeAttach,
  version: '3.1.0+1',
);

int _recipeEstimateSize(
  Recipe object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ingredientAmounts.length * 8;
  bytesCount += 3 + object.ingredientFoodIds.length * 3;
  {
    for (var i = 0; i < object.ingredientFoodIds.length; i++) {
      final value = object.ingredientFoodIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.ingredientNames.length * 3;
  {
    for (var i = 0; i < object.ingredientNames.length; i++) {
      final value = object.ingredientNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final list = object.preparationSteps;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _recipeSerialize(
  Recipe object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.caloriesPerServing);
  writer.writeDouble(offsets[1], object.carbsPerServing);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeDouble(offsets[4], object.fatsPerServing);
  writer.writeString(offsets[5], object.imageUrl);
  writer.writeDoubleList(offsets[6], object.ingredientAmounts);
  writer.writeStringList(offsets[7], object.ingredientFoodIds);
  writer.writeStringList(offsets[8], object.ingredientNames);
  writer.writeBool(offsets[9], object.isFavorite);
  writer.writeString(offsets[10], object.name);
  writer.writeStringList(offsets[11], object.preparationSteps);
  writer.writeDouble(offsets[12], object.proteinPerServing);
  writer.writeLong(offsets[13], object.servings);
  writer.writeStringList(offsets[14], object.tags);
  writer.writeDouble(offsets[15], object.totalCalories);
  writer.writeDouble(offsets[16], object.totalCarbs);
  writer.writeDouble(offsets[17], object.totalFats);
  writer.writeDouble(offsets[18], object.totalProtein);
  writer.writeDateTime(offsets[19], object.updatedAt);
}

Recipe _recipeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Recipe();
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[5]);
  object.ingredientAmounts = reader.readDoubleList(offsets[6]) ?? [];
  object.ingredientFoodIds = reader.readStringList(offsets[7]) ?? [];
  object.ingredientNames = reader.readStringList(offsets[8]) ?? [];
  object.isFavorite = reader.readBool(offsets[9]);
  object.name = reader.readString(offsets[10]);
  object.preparationSteps = reader.readStringList(offsets[11]);
  object.servings = reader.readLong(offsets[13]);
  object.tags = reader.readStringList(offsets[14]);
  object.totalCalories = reader.readDouble(offsets[15]);
  object.totalCarbs = reader.readDouble(offsets[16]);
  object.totalFats = reader.readDouble(offsets[17]);
  object.totalProtein = reader.readDouble(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  return object;
}

P _recipeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readStringList(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeGetId(Recipe object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeGetLinks(Recipe object) {
  return [];
}

void _recipeAttach(IsarCollection<dynamic> col, Id id, Recipe object) {
  object.id = id;
}

extension RecipeQueryWhereSort on QueryBuilder<Recipe, Recipe, QWhere> {
  QueryBuilder<Recipe, Recipe, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecipeQueryWhere on QueryBuilder<Recipe, Recipe, QWhereClause> {
  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterWhereClause> idBetween(
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

extension RecipeQueryFilter on QueryBuilder<Recipe, Recipe, QFilterCondition> {
  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> caloriesPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      caloriesPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      caloriesPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> caloriesPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caloriesPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> carbsPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      carbsPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> carbsPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> carbsPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbsPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> fatsPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> fatsPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> fatsPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> fatsPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatsPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientAmounts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientAmounts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientAmounts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientAmounts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientAmountsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientAmounts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientFoodIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientFoodIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientFoodIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientFoodIds',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientFoodIds',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientFoodIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientFoodIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> ingredientNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      ingredientNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredientNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> preparationStepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preparationSteps',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preparationSteps',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preparationSteps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preparationSteps',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preparationSteps',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preparationSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preparationSteps',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      preparationStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preparationSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> proteinPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition>
      proteinPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> proteinPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> proteinPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proteinPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> servingsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> servingsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> servingsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> servingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalFatsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalFatsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalFatsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFats',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalFatsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> totalProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Recipe, Recipe, QAfterFilterCondition> updatedAtBetween(
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

extension RecipeQueryObject on QueryBuilder<Recipe, Recipe, QFilterCondition> {}

extension RecipeQueryLinks on QueryBuilder<Recipe, Recipe, QFilterCondition> {}

extension RecipeQuerySortBy on QueryBuilder<Recipe, Recipe, QSortBy> {
  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCaloriesPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCarbsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByFatsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByFatsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByProteinPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbs', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbs', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFats', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFats', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProtein', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByTotalProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProtein', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension RecipeQuerySortThenBy on QueryBuilder<Recipe, Recipe, QSortThenBy> {
  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCaloriesPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCarbsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByFatsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByFatsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatsPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByProteinPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbs', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbs', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFats', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFats', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProtein', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByTotalProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProtein', Sort.desc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension RecipeQueryWhereDistinct on QueryBuilder<Recipe, Recipe, QDistinct> {
  QueryBuilder<Recipe, Recipe, QDistinct> distinctByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caloriesPerServing');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbsPerServing');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByFatsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatsPerServing');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByIngredientAmounts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientAmounts');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByIngredientFoodIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientFoodIds');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByIngredientNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientNames');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByPreparationSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preparationSteps');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteinPerServing');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servings');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCalories');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByTotalCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCarbs');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByTotalFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFats');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByTotalProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalProtein');
    });
  }

  QueryBuilder<Recipe, Recipe, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension RecipeQueryProperty on QueryBuilder<Recipe, Recipe, QQueryProperty> {
  QueryBuilder<Recipe, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> caloriesPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caloriesPerServing');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> carbsPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbsPerServing');
    });
  }

  QueryBuilder<Recipe, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Recipe, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> fatsPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatsPerServing');
    });
  }

  QueryBuilder<Recipe, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Recipe, List<double>, QQueryOperations>
      ingredientAmountsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientAmounts');
    });
  }

  QueryBuilder<Recipe, List<String>, QQueryOperations>
      ingredientFoodIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientFoodIds');
    });
  }

  QueryBuilder<Recipe, List<String>, QQueryOperations>
      ingredientNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientNames');
    });
  }

  QueryBuilder<Recipe, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Recipe, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Recipe, List<String>?, QQueryOperations>
      preparationStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preparationSteps');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> proteinPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteinPerServing');
    });
  }

  QueryBuilder<Recipe, int, QQueryOperations> servingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servings');
    });
  }

  QueryBuilder<Recipe, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> totalCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCalories');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> totalCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCarbs');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> totalFatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFats');
    });
  }

  QueryBuilder<Recipe, double, QQueryOperations> totalProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalProtein');
    });
  }

  QueryBuilder<Recipe, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
