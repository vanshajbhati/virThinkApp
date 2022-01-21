class FetchProduct {
  int? errorCode;
  String? responseString;
  List<Data>? data;
  Null? data1;
  Null? data2;
  Null? data3;

  FetchProduct(
      {this.errorCode,
        this.responseString,
        this.data,
        this.data1,
        this.data2,
        this.data3});

  FetchProduct.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    data1 = json['data1'];
    data2 = json['data2'];
    data3 = json['data3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['response_string'] = this.responseString;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    return data;
  }
}

class Data {
  String? id;
  String? subCategoryId;
  String? name;
  String? description;
  String? images;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Data(
      {this.id,
        this.subCategoryId,
        this.name,
        this.description,
        this.images,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}