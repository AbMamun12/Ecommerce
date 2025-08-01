import 'package:e_commerce/features/common/data/models/category_model.dart';

class CategoryPaginationModel {
  String? msg;
  List<CategoryItemModel>? categoryList;

  CategoryPaginationModel({this.msg, this.categoryList});

  CategoryPaginationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryItemModel>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.categoryList != null) {
      data['data'] = this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

