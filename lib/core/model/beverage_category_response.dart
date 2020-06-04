import 'package:gankglobal/core/model/beverage_category.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageCategoryResponse {
  final List<BeverageCategory> beverageCategory;
  final String error;

  /// Factory method for displaying data
  BeverageCategoryResponse.fromJson(Map<String, dynamic> json)
      : beverageCategory = (json["drinks"] as List)
            .map((i) => new BeverageCategory.fromJson(i))
            .toList(),
        error = "";

  /// Factory method for displaying error
  BeverageCategoryResponse.withError(String errorValue)
      : beverageCategory = List(),
        error = errorValue;
}
