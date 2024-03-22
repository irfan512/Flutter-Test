// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:testapp/Module/Home/Service/home_service.dart';
import 'package:testapp/Module/Home/View/Model/home_model.dart';

import 'package:testapp/Utils/toast_message.dart';

class HomeProvider extends ChangeNotifier with AuthService {
  List<HomePostModel> postsList = [];
  bool success = false;

  Future<void> postDetailsApi({
    required Map<String, dynamic> postData,
    required BuildContext context,
  }) async {
    try {
      var response = await postDetailsService(postData: postData);
      log(response.toString());
      if (response != null) {
        log("parsingggg data ");
        List<HomePostModel> postDetails = (response as List)
            .map((item) => HomePostModel.fromJson(item))
            .toList();
        success = true;
        postsList = postDetails;
        notifyListeners();
      } else {
        ShowMessage.onFail('Data Didnt exists');
      }
    } catch (error) {
      log("Error fetching data: $error");
      success = false; // Ensure success is false in case of errors
      notifyListeners();
    }
  }


  PageController get controller => _controller;
  PageController _controller = PageController();
  bool _isLastPage = false;
  bool get isLastPage => _isLastPage;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

 void setPage(int index) {
    _currentIndex = index;
    notifyListeners();
  }


}
