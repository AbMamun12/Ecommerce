import 'package:e_commerce/features/home/data/models/slider_list_data_model.dart';

class PaginationCommonResponseModel <T>{
  int? code;
  String? status;
  String? msg;
  PaginationModel? data;

  PaginationCommonResponseModel({this.code, this.status, this.msg, this.data});

  PaginationCommonResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? PaginationModel.fromJson(json['data'])
        : null;
  }
}

