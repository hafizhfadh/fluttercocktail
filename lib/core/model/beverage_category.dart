/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageCategory {
  String strCategory;

  BeverageCategory(this.strCategory);

  /// Factory method
  BeverageCategory.fromJson(Map<String, dynamic> json)
      : strCategory = json["strCategory"];
}
