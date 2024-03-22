// ignore_for_file: body_might_complete_normally_catch_error, prefer_typing_uninitialized_variables

part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future postRequest({required String apiUrl, data}) async {
    var response = await _dio.post(
      apiUrl,
      data: data,
      options: Options(headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((onError) {
      debugPrint("POST Error: $onError");

      ShowMessage().showErrorMessage(
          ServerError.withError(error: onError).getErrorMessage().toString());
    });

    return response;
  }
}
