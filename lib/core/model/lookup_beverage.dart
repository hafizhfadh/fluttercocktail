/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class LookupBeverage {
  String idDrink;
  String strDrink;
  String strCategory;
  String strAlcoholic;
  String strGlass;
  String strInstructions;
  String strDrinkThumb;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;

  LookupBeverage(
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strDrinkThumb,
  );

  /// Factory method
  LookupBeverage.fromJson(Map<String, dynamic> json)
      : idDrink = json["idDrink"],
        strDrink = json["strDrink"],
        strCategory = json["strCategory"],
        strAlcoholic = json["strAlcoholic"],
        strGlass = json["strGlass"],
        strInstructions = json["strInstructions"],
        strIngredient1 = json["strIngredient1"],
        strIngredient2 = json["strIngredient2"],
        strIngredient3 = json["strIngredient3"],
        strIngredient4 = json["strIngredient4"],
        strIngredient5 = json["strIngredient5"],
        strMeasure1 = json["strMeasure1"],
        strMeasure2 = json["strMeasure2"],
        strMeasure3 = json["strMeasure3"],
        strMeasure4 = json["strMeasure4"],
        strDrinkThumb = json["strDrinkThumb"];
}
