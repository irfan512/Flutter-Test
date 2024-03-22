import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Module/Home/View/Model/home_model.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';

import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/app_button.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';

class BottomLeftList extends StatelessWidget {
  final HomePostModel data;
  const BottomLeftList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          height: AppConfig(context).height * .3,
          width: AppConfig(context).width * .75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: data.postTitle.toString(),
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                size: 14,
                maxLines: 2,
                txtOverFlow: TextOverflow.ellipsis,
              ),
              CustomText(
                title: "AED ${data.price}",
                color: AppColor.lightAmber,
                fontWeight: FontWeight.w700,
                size: 22,
                maxLines: 2,
                txtOverFlow: TextOverflow.ellipsis,
              ),
              CustomText(
                title: "${data.description} ${data.hashtagTitles}",
                maxLines: 2,
                txtOverFlow: TextOverflow.ellipsis,
                color: AppColor.white,
              ),
              Gap.h(10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/564x/bb/c8/e3/bbc8e3284695af9d4702ac07fca11d2e.jpg"),
                  ),
                  Gap.w(10),
                  CustomText(
                    title: "${data.country}",
                    color: AppColor.white,
                    maxLines: 2,
                    txtOverFlow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Gap.h(10),
              PrimaryBTN(
                  borderRadius: 10,
                  height: 40,
                  callback: () {},
                  color: AppColor.primaryColor,
                  title: "Visit Website",
                  width: AppConfig(context).width * .42),
              Gap.h(10),
            ],
          ),
        ),
      ),
    );
  }
}
