import 'package:cookly/core/response/pagination_response.dart';
import 'package:equatable/equatable.dart';

class RecipeResponse extends PaginatedResponse {
  final List<Recipe> recipes;

  RecipeResponse({
    required this.recipes,
    required super.skip,
    required super.limit,
    required super.total,
  });

  RecipeResponse copyWith({
    List<Recipe>? recipes,
    int? total,
    int? skip,
    int? limit,
  }) {
    return RecipeResponse(
      recipes: recipes ?? this.recipes,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      recipes:
          json["recipes"] == null
              ? []
              : List<Recipe>.from(
                json["recipes"]!.map((x) => Recipe.fromJson(x)),
              ),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }
}

class Recipe extends Equatable {
  const Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final num? prepTimeMinutes;
  final num? cookTimeMinutes;
  final num? servings;
  final String? difficulty;
  final String? cuisine;
  final num? caloriesPerServing;
  final List<String> tags;
  final num? userId;
  final String image;
  final num? rating;
  final num? reviewCount;
  final List<String> mealType;

  Recipe copyWith({
    int? id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    num? prepTimeMinutes,
    num? cookTimeMinutes,
    num? servings,
    String? difficulty,
    String? cuisine,
    num? caloriesPerServing,
    List<String>? tags,
    num? userId,
    String? image,
    num? rating,
    num? reviewCount,
    List<String>? mealType,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      cuisine: cuisine ?? this.cuisine,
      caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
      tags: tags ?? this.tags,
      userId: userId ?? this.userId,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      mealType: mealType ?? this.mealType,
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"],
      name: json["name"],
      ingredients:
          json["ingredients"] == null
              ? []
              : List<String>.from(json["ingredients"]!.map((x) => x)),
      instructions:
          json["instructions"] == null
              ? []
              : List<String>.from(json["instructions"]!.map((x) => x)),
      prepTimeMinutes: json["prepTimeMinutes"],
      cookTimeMinutes: json["cookTimeMinutes"],
      servings: json["servings"],
      difficulty: json["difficulty"],
      cuisine: json["cuisine"],
      caloriesPerServing: json["caloriesPerServing"],
      tags:
          json["tags"] == null
              ? []
              : List<String>.from(json["tags"]!.map((x) => x)),
      userId: json["userId"],
      image: json["image"],
      rating: json["rating"],
      reviewCount: json["reviewCount"],
      mealType:
          json["mealType"] == null
              ? []
              : List<String>.from(json["mealType"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ingredients": ingredients.map((x) => x).toList(),
    "instructions": instructions.map((x) => x).toList(),
    "prepTimeMinutes": prepTimeMinutes,
    "cookTimeMinutes": cookTimeMinutes,
    "servings": servings,
    "difficulty": difficulty,
    "cuisine": cuisine,
    "caloriesPerServing": caloriesPerServing,
    "tags": tags.map((x) => x).toList(),
    "userId": userId,
    "image": image,
    "rating": rating,
    "reviewCount": reviewCount,
    "mealType": mealType.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    id,
    name,
    ingredients,
    instructions,
    prepTimeMinutes,
    cookTimeMinutes,
    servings,
    difficulty,
    cuisine,
    caloriesPerServing,
    tags,
    userId,
    image,
    rating,
    reviewCount,
    mealType,
  ];
}
