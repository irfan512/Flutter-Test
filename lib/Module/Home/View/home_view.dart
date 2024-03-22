// ignore_for_file: sized_box_for_whitespace

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Module/Home/View/Components/bottom_left_list.dart';
import 'package:testapp/Module/Home/View/Components/bottom_right_list.dart';
import 'package:testapp/Module/Home/View/Components/top_list.dart';
import 'package:testapp/Module/Home/View/Components/video_view.dart';
import 'package:testapp/Module/Home/View/Model/home_model.dart';
import 'package:testapp/Module/Home/ViewModel/home_view_model.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.postDetailsApi(postData: {}, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("CALLLLLLL BUILD");
    return Scaffold(
      backgroundColor: AppColor.screenBG,
      body: Consumer<HomeProvider>(builder: (contex, homeProvider, child) {
        if (homeProvider.postsList.isEmpty && homeProvider.success == true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.block,
                  color: AppColor.white,
                  size: 50,
                ),
                Gap.h(10),
                CustomText(
                  title: "No Post Data Found!",
                  color: AppColor.white,
                  size: 20,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          );
        } else if (homeProvider.success == true &&
            homeProvider.postsList.isNotEmpty) {
          return PageView.builder(
              itemCount: homeProvider.postsList.length,
              physics: const ClampingScrollPhysics(),
              pageSnapping: true,
              onPageChanged: (value) {},
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ItemScreen(
                  data: homeProvider.postsList[index],
                );
              });
        } else {
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColor.white,
              radius: 22,
            ),
          );
        }
      }),
    );
  }
}

class ItemScreen extends StatefulWidget {
  final HomePostModel data;
  ItemScreen({required this.data});
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.images!.length + 1,
          onPageChanged: (value) {
            context.read<HomeProvider>().setPage(value);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return VideoView(
                  widget.data.postVideo.toString(), (controller) {});
            } else {
              return Container(
                height: AppConfig(context).width,
                width: AppConfig(context).height,
                child: CachedNetworkImage(
                  imageUrl:
                      "http://95.216.221.251/dev/users/posts/${widget.data.images![index - 1].image}",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => Center(
                    child: CupertinoActivityIndicator(
                        color: AppColor.white,
              radius: 22,
                    ),
                  ),
                ),
              );
            }
          },
        ),
        const TopList(),
        BottomRightList(
          data: widget.data,
        ),
        BottomLeftList(
          data: widget.data,
        ),
        Consumer<HomeProvider>(builder: (contex, homeProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 7,
                width: AppConfig(context).width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.data.images!.length + 1,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        index > 0 ? Gap.w(8) : Gap.w(0),
                        AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                          width: index == homeProvider.currentIndex ? 20 : 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: index == homeProvider.currentIndex
                                ? AppColor.lightAmber
                                : AppColor.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
