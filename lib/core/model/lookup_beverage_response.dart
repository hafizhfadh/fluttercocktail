import 'package:gankglobal/core/model/lookup_beverage.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class LookupBeverageResponse {
  final List<LookupBeverage> lookUpBeverage;
  final String error;

  /// Factory method for displaying data
  LookupBeverageResponse.fromJson(Map<String, dynamic> json)
      : lookUpBeverage = (json["drinks"] as List)
            .map((i) => new LookupBeverage.fromJson(i))
            .toList(),
        error = "";

  /// Factory method for displaying error
  LookupBeverageResponse.withError(String errorValue)
      : lookUpBeverage = List(),
        error = errorValue;
}
