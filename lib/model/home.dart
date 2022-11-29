class Home {
  late bool status;
  late Data? data;


  Home.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Banners>banners =[];
  List<Products> product=[];

  Data.fromJson(Map<String, dynamic> json) {

   json['banners'].forEach((element ) {
      banners.add(Banners.fromJson(element));
                            
    });
  json['products'].forEach((element) {
      product.add(Products.fromJson(element));
   });
        }




  }

class Banners {
  late int id;
  late String image;
  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

  }


}

class Products {
  late int id;
 late String name;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late bool inFavorites;
  late bool inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
