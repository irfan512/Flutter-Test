import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:testapp/Module/Home/View/Model/top_list_model.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';

class TopList extends StatefulWidget {
  const TopList({
    super.key,
  });

  @override
  State<TopList> createState() => _TopListState();
}

class _TopListState extends State<TopList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: SizedBox(
        height: AppConfig(context).height * .13,
        width: AppConfig(context).width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: topListModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Column(
              children: [
                InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () async {
                      // Get.toNamed(AppRoutes.blogDetail);
                    },
                    child: Container(
                        height: AppConfig(context).height * .07,
                        width: AppConfig(context).width * .14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: const GradientBoxBorder(
                              gradient: AppColor.primaryGradient,
                            )),
                        child: Image.asset(
                          topListModel[index].image,
                          scale: 4,
                        ))),
                Gap.h(5),
                CustomText(
                  title: topListModel[index].heading,
                  size: 13,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
