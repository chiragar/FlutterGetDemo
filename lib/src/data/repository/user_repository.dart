import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterlivedemo/src/core/api.dart';
import 'package:flutterlivedemo/src/data/model/user_model.dart';

class UserRepository {
  final _api = Api();


  Future<List<UserModel>> fetchAllUsers() async {
    try {
      Response response = await _api.sendRequest.get("/");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // if(!apiResponse.success) {
      //   throw apiResponse.message.toString();
      // }
      //
      apiResponse.data=userList;
      return apiResponse.data;

      // return (apiResponse.data as List<dynamic>).map((json) => UserModel.fromJson(json)).toList();
    }
    catch(ex) {
      rethrow;
    }
  }


}