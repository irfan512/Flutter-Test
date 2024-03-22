import 'package:testapp/Utils/constant/app_images.dart';

class TopListModel {
  final String image;
  final String heading;
  TopListModel({
    required this.image,
    required this.heading,
  });
}

List<TopListModel> topListModel = [
  TopListModel(
    image: AppImages.addIcon,
    heading: "Add Listing",
  ),
  TopListModel(
    image: AppImages.search,
    heading: "Search",
  ),
  TopListModel(
    image: AppImages.notification,
    heading: "Notification",
  ),
  TopListModel(
    image: AppImages.electronic,
    heading: "Electronics",
  ),
  TopListModel(
    image: AppImages.appliances,
    heading: "Appliances",
  ),
];
