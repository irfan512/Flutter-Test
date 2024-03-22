

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testapp/Network/server_error.dart';
import 'package:testapp/Utils/toast_message.dart';

part 'api_client_g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        headers: ({"Content-Type": "application/json", "Accept": "*/*"}));
    return _ApiClient(dio);
  }

  Future postRequest({
    required String apiUrl,
    var data,
  });


}
