class Search {
late  bool status;
 late dynamic message;
  Data? data;
Search();
  Search.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
late  dynamic currentPage;
  List<DataModel> data=[];
 late String firstPageUrl;
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

      json['data'].forEach((element) {
        data.add(DataModel.fromJson(element));
      });
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
 late dynamic price;
 late String image;
  late String name;
 late String description;
 late dynamic  images;
 late bool inFavorites;
 late bool inCart;


  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}