class CategoryWiseModel {
  String? status;
  Data? data;

  CategoryWiseModel({this.status, this.data});

  CategoryWiseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Product>? hotSelling;
  List<Product>? topSelling;
  List<Product>? newProduct;

  Data({this.hotSelling, this.topSelling, this.newProduct});

  Data.fromJson(Map<String, dynamic> json) {
    // hot-selling
    if (json['hot-selling'] != null) {
      hotSelling = <Product>[];
      json['hot-selling'].forEach((v) {
        hotSelling!.add(Product.fromJson(v));
      });
    }
    // top-selling
    if (json['top-selling'] != null) {
      topSelling = <Product>[];
      json['top-selling'].forEach((v) {
        topSelling!.add(Product.fromJson(v));
      });
    }
    // new-product
    if (json['new-product'] != null) {
      newProduct = <Product>[];
      json['new-product'].forEach((v) {
        newProduct!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotSelling != null) {
      data['hot-selling'] = hotSelling!.map((v) => v.toJson()).toList();
    }
    if (topSelling != null) {
      data['top-selling'] = topSelling!.map((v) => v.toJson()).toList();
    }
    if (newProduct != null) {
      data['new-product'] = newProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// আলাদা আলাদা ক্লাস না লিখে একটি কমন 'Product' ক্লাস ব্যবহার করা ভালো
// কারণ সব প্রোডাক্টের প্রপার্টি একই।
class Product {
  int? id;
  String? title;
  String? sku;
  String? brand;
  num? price;      // num ব্যবহার করা হয়েছে int/double এর