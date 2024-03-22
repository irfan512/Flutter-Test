import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:testapp/Network/api_client.dart';
import 'package:testapp/Network/api_url.dart';
import 'package:testapp/Utils/toast_message.dart';

mixin AuthService {


  // Future<Map<String, dynamic>?> postDetailsService(
  //     {required Map<String, dynamic> postData}) async {
  //   String url = ApiUrl.homePostUrl;
  //   try {
  //     var response =
  //         await ApiClient(Dio()).postRequest(apiUrl: url, data: postData);
  //     if (response.data != null && response.data["status"] == true) {
  //       log("Post details fetched successfully.");
  //       ShowMessage.onSuccess("Post loaded successfully");
  //       return response.data;
  //     } else {
  //       ShowMessage.onFail('Data Didnt exists');
  //       log("Response: ${response.data}");
  //       return null;
  //     }
  //   } catch (e) {
  //     log("Error fetching post details: $e");
  //     return null;
  //   }
  // }




Future postDetailsService(
    {required Map<String, dynamic> postData}) async {
  String url = ApiUrl.homePostUrl;
  try {
    var response = await ApiClient(Dio()).postRequest(apiUrl: url, data: postData);
    if (response.data != null && response.data["status"] == true) {
      var dataList = response.data["posts"] as List;
      List parsedData = dataList;
      log("Post details fetched successfully.");
      ShowMessage.onSuccess("Post loaded successfully");
      return parsedData;
    } else {
      ShowMessage.onFail('Data Didnt exists');
      log("Response: ${response.data}");
      return null;
    }
  } catch (e) {
    log("Error fetching post details: $e");
    return null;
  }
}



}
