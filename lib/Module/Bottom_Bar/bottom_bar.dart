import 'package:flutter/material.dart';
import 'package:testapp/Module/Home/View/home_view.dart';

import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/app_images.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: _getScreen(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: AppColor.primaryColor,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              ),
          selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 0
                    ? AppImages.home
                    : AppImages.home,
                color: _selectedIndex == 0
                    ? AppColor.lightPrimary
                    : AppColor.lightgrey,
                height: 30,
                width: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
               AppImages.search,
                color: _selectedIndex == 1
                    ? AppColor.lightPrimary
                    : AppColor.lightgrey,
                height: 30,
                width: 30,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          AppColor.lightPrimary,
                          AppColor.darkPrimary,
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                 AppImages.addIcon,
                  color: AppColor.black,
                  scale: 3,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
               AppImages.dealsIcon,
                color: _selectedIndex == 3
                    ? AppColor.lightPrimary
                    : AppColor.lightgrey,
                height: 27,
                width: 27,
              ),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.profileIcon,
                color: _selectedIndex == 4
                    ? AppColor.lightPrimary
                    : AppColor.lightgrey,
                height: 30,
                width: 30,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: AppColor.lightgrey,
          selectedItemColor: AppColor.lightPrimary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      default:
        return Container();
    }
  }
}
