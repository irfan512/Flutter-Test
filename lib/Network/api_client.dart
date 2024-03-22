import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
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

  Future getRequest({
    required String apiUrl,
  });

  Future getRequestHeader({required String apiUrl, required String token});
  Future deleteRequestHeader({required String apiUrl, required String token});

  Future postRequest({
    required String apiUrl,
    var data,
  });

  Future postRequestHeader({
    required String apiUrl,
    var data,
    required String token,
  });
  Future postRequestBody({
    required String apiUrl,
    required String token,
  });

  Future patchRequestHeader(
      {required String apiUrl, var data, required String token});

  Future downloadPDFHeader({required String pdfUrl});

  Future putRequest({required String apiUrl, var data});

  Future putRequestHeader({
    required String apiUrl,
    var data,
    required String token,
  });

  Future profileUpdateMultiPart(
      {required String apiUrl,
      required FormData formData,
      required String token});

  Future imagePickerScanData(
      {required String apiUrl, required FormData formData});
}
