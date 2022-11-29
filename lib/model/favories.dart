import 'categories.dart';

class FavoritesModel {
 late bool status;
 late dynamic  message;
  Data?  data;
 FavoritesModel();


  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?Data.fromJson(json['data']) : null;
  }

}

class Data {
  late dynamic currentPage;
  late List<DataModel> dataModel = [];
  late dynamic firstPageUrl;
  late dynamic from;
  late dynamic lastPage;
  late dynamic lastPageUrl;
  late dynamic nextPageUrl;
  late dynamic path;
  late dynamic perPage;
  late dynamic prevPageUrl;
  late dynamic to;
  late dynamic total;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataModel = <DataModel>[];
      json['data'].forEach((v) {
        dataModel.add(DataModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class DataModel {
  late dynamic id;
   Product? product;


  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
      json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}


class Product {
late  int   id;
late  dynamic   price;
late  dynamic  oldPrice;
late  dynamic   discount;
late  dynamic   image;
late  dynamic   name;
late  dynamic   description;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}