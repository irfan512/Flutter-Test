import 'package:flutter/material.dart';
import 'package:testapp/Module/Home/View/Model/home_model.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/app_images.dart';

class BottomRightList extends StatelessWidget {
  final HomePostModel data;
  const BottomRightList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              width: AppConfig(context).width * .11,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColor.primaryGradient,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppImages.offer),
                  height: 24,
                ),
              ),
            ),
            Text(
              "Offer",
              style: TextStyle(color: AppColor.white),
            ),
            Container(
              height: 60,
              width: AppConfig(context).width * .11,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColor.primaryGradient,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppImages.favourite),
                  height: 20,
                ),
              ),
            ),
            Text(
              data.likes.toString(),
              style: TextStyle(color: AppColor.white),
            ),
            Container(
              height: 60,
              width: AppConfig(context).width * .11,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColor.primaryGradient,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppImages.chatIcon),
                  height: 20,
                ),
              ),
            ),
            Text(
              data.comments.toString(),
              style: TextStyle(color: AppColor.white),
            ),
            Container(
              height: 60,
              width: AppConfig(context).width * .11,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColor.primaryGradient,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppImages.share),
                  height: 20,
                ),
              ),
            ),
            Text(
              data.shares.toString(),
              style: TextStyle(color: AppColor.white),
            ),
            data.profileImage==null
                ? Container(
                    height: 60,
                    width: AppConfig(context).width * .11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )
                : Container(
                    height: 60,
                    width: AppConfig(context).width * .11,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              data.profileImage!.toString(),
                            ),
                            fit: BoxFit.cover)),
                  ),
            data.name == null
                ? const SizedBox()
                : SizedBox(
                    width: AppConfig(context).width * .11,
                    child: Text(
                      data.name!,
                      style: TextStyle(color: AppColor.white,fontSize: 12),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
