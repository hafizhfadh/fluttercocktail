import 'package:dio/dio.dart';
import 'package:gankglobal/core/model/beverage_category_response.dart';
import 'package:gankglobal/core/model/list_by_glass_response.dart';
import 'package:gankglobal/core/model/lookup_beverage_response.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageRepository {
  /// Initialize
  static String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/";
  final Dio _dio = Dio();

  /// Get category data
  Future<BeverageCategoryResponse> getCategory() async {
    var params = {'c': 'list'};
    try {
      /// Get response from api
      Response response =
          await _dio.get('$baseUrl/list.php', queryParameters: params);
      /// Parse data to factory method
      return BeverageCategoryResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      /// Catch error and showing the error
      print("Exeption occured: $error stackTrace: $stackTrace");
      return BeverageCategoryResponse.withError("$error");
    }
  }

  /// Get category data by filter status
  Future<LookupBeverageResponse> getFilterCategory(String filter) async {
    var params = {'c': filter ?? 'Cocktail'};
    try {
      /// Get response from api
      Response response =
      await _dio.get('$baseUrl/filter.php', queryParameters: params);
      /// Parse data to factory method
      return LookupBeverageResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      /// Catch error and showing the error
      print("Exeption occured: $error stackTrace: $stackTrace");
      return LookupBeverageResponse.withError("$error");
    }
  }

  /// Get filter data by glass
  Future<ListByGlassResponse> getFilterByGlass(String filter) async {
    var params = {'g': filter ?? 'Cocktail glass'};
    try {
      /// Get response from api
      Response response =
      await _dio.get('$baseUrl/filter.php', queryParameters: params);
      /// Parse data to factory method
      return ListByGlassResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      /// Catch error and showing the error
      print("Exeption occured: $error stackTrace: $stackTrace");
      return ListByGlassResponse.withError("$error");
    }
  }

  /// Get filter data by ID
  Future<LookupBeverageResponse> getLookupId(String id) async {
    var params = {'i': id ?? '17701'};
    try {
      /// Get response from api
      Response response =
      await _dio.get('$baseUrl/lookup.php', queryParameters: params);
      /// Parse data to factory method
      print(id.toString()+"ASELOLE");
      return LookupBeverageResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      /// Catch error and showing the error
      print("Exeption occured: $error stackTrace: $stackTrace");
      return LookupBeverageResponse.withError("$error");
    }
  }
}
