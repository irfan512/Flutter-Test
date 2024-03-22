import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:testapp/Utils/Theme/colors.dart';

class ShowMessage {
  static onSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static onFail(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showErrorMessage(String message) {
    if (Get.isSnackbarOpen == false) {
      return Get.snackbar(
        "Error".tr,
        message.tr,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 200),
        isDismissible: true,
        forwardAnimationCurve: Curves.linear,
      );
    }
  }


}
