class ProductModel {
  String? status;
  List<Data>? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? stock;
  String? sku;
  String? brand;
  String? price;
  String? oldPrice;
  String? image;
  String? rating;
  String? reviewCount;
  String? category;

  Data(
      {this.id,
        this.title,
        this.stock,
        this.sku,
        this.brand,
        this.price,
        this.oldPrice,
        this.image,
        this.rating,
        this.reviewCount,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    stock = json['stock'];
    sku = json['sku'];
    brand = json['brand'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    rating = json['rating'];
    reviewCount = json['review_count'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['stock'] = this.stock;
    data['sku'] = this.sku;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['review_count'] = this.reviewCount;
    data['category'] = this.category;
    return data;
  }
}
