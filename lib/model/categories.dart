

class Categories {
  late bool status;
  Data? data;
  Categories();
  Categories.fromJson(Map<String, dynamic> json) {

      status = json['status'];
      data = json['data'] != null ? Data.fromJson(json['data']) : null;
    }
  }

//


class Data {
 late dynamic currentPage;
  List<DataModel> dataModel=[];

 Data.fromJson(Map<String, dynamic> json) {
   currentPage = json['currentPage'];
   json['data'].forEach((element) {
     dataModel.add(DataModel.fromJson(element));
   });
 }

}


  class DataModel{
   late int id;
   late String name;
   late String image;

   DataModel.fromJson(Map<String, dynamic> json) {

     id= json['id'];
       name=json['name'];
       image=json['image'];
     }

  }



