class GetSingleProductModel {
  String? status;
  Data? data;

  GetSingleProductModel({this.status, this.data});

  GetSingleProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  String? title;
  String? sku;
  String? brand;
  int? price;
  int? oldPrice;
  int? stock;
  String? image;
  List<String>? gallery;
  String? description;
  List<String>? tags;
  String? videoUrl;
  double? rating;
  int? reviewCount;
  String? category;

  Data(
      {this.id,
        this.categoryId,
        this.title,
        this.sku,
        this.brand,
        this.price,
        this.oldPrice,
        this.stock,
        this.image,
        this.gallery,
        this.description,
        this.tags,
        this.videoUrl,
        this.rating,
        this.reviewCount,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    sku = json['sku'];
    brand = json['brand'];
    price = json['price'];
    oldPrice = json['old_price'];
    stock = json['stock'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    description = json['description'];
    tags = json['tags'].cast<String>();
    videoUrl = json['video_url'];
    rating = json['rating'];
    reviewCount = json['review_count'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['sku'] = this.sku;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['stock'] = this.stock;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['video_url'] = this.videoUrl;
    data['rating'] = this.rating;
    data['review_count'] = this.reviewCount;
    data['category'] = this.category;
    return data;
  }
}
