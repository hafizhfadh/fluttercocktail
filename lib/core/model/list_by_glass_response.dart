import 'package:gankglobal/core/model/list_by_glass.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class ListByGlassResponse {
  final List<ListByGlass> listByGlass;
  final String error;

  /// Factory method for displaying data
  ListByGlassResponse.fromJson(Map<String, dynamic> json)
      : listByGlass = (json["drinks"] as List)
            .map((i) => new ListByGlass.fromJson(i))
            .toList(),
        error = "";

  /// Factory method for displaying error
  ListByGlassResponse.withError(String errorValue)
      : listByGlass = List(),
        error = errorValue;
}
