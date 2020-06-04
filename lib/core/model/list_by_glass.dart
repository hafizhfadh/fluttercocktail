/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class ListByGlass {
  String idDrink;
  String strDrink;
  String strDrinkThumb;

  ListByGlass(this.idDrink,this.strDrink,this.strDrinkThumb);

  /// Factory method
  ListByGlass.fromJson(Map<String, dynamic> json)
      : idDrink = json["idDrink"],
        strDrink = json["strDrink"],
        strDrinkThumb = json["strDrinkThumb"];
}