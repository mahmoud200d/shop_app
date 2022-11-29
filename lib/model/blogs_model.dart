class BlogsModel {
 late bool  status;
 late int  code;
 late String  message;
  List<Items>  items=[];

  BlogsModel();


  BlogsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
      json['items'].forEach((v) {
        items.add( Items.fromJson(v));
      });
    }
  }




class Items {
late int  id;
late String  userId;
late int  categoryId;
late String  viewCount;
late String  image;
late String  status;
late String  createdAt;
late String  name;
late String  shortDetails;
late String  details;
late String  author;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    viewCount = json['view_count'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
    shortDetails = json['short_details'];
    details = json['details'];
    author = json['author'];
  }


}