

import 'package:testapp/Utils/constant/app_images.dart';

class OnBoardingScreenModel {
  final String image;
  final String title;
  final String detail;
  OnBoardingScreenModel({
    required this.image,
    required this.title,
    required this.detail,
  });
}

List<OnBoardingScreenModel> onBoardingScreenModel = [
  OnBoardingScreenModel(
      image: AppImages.onboardOne,
      title: "Discover Great Deals",
      detail:
          "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!"),
  OnBoardingScreenModel(
      image: AppImages.onboardTwo,
      title: "Effortless Selling",
      detail:
          "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!"),
  OnBoardingScreenModel(
      image: AppImages.onboardThree,
      title: "Promote Your Business",
      detail:
          "Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,"),
];

