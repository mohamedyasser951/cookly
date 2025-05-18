import 'package:cookly/core/constants/app_colors.dart';
import 'package:cookly/core/constants/assets.dart';
import 'package:cookly/features/home/presentation/cubits/bottom_nav/bottom_nav.dart';
import 'package:cookly/features/home/presentation/pages/home_screen.dart';
import 'package:cookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLayoutScreen extends StatelessWidget {
  HomeLayoutScreen({super.key});
  final List<Widget> pages = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BottomNavCubit>(),
      child: Builder(
        builder: (context) {
          void onTabSelected(int index) =>
              context.read<BottomNavCubit>().changeIndex(index);
          return BlocBuilder<BottomNavCubit, int>(
            builder: (context, index) {
              return Scaffold(
                extendBody: true,
                backgroundColor: AppColors.scaffoldBackgroundColor,
                body: IndexedStack(index: index, children: pages),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: AppColors.secondaryColor,
                  child: SvgPicture.asset(
                    Assets.imagesChef,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  notchMargin: 10,
                  elevation: 10,
                  color: AppColors.scaffoldBackgroundColor,
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.imagesHome,
                          colorFilter: ColorFilter.mode(
                            index == 0 ? AppColors.primaryColor : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => onTabSelected(0),
                        tooltip: 'Home',
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.imagesSearch,
                          colorFilter: ColorFilter.mode(
                            index == 1 ? AppColors.primaryColor : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => onTabSelected(1),
                        tooltip: 'Search',
                      ),
                      const SizedBox(width: 48), // Space for the FAB notch

                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.imagesNotification,
                          colorFilter: ColorFilter.mode(
                            index == 2 ? AppColors.primaryColor : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => onTabSelected(2),
                        tooltip: 'Notifications',
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.imagesProfile,
                          colorFilter: ColorFilter.mode(
                            index == 3 ? AppColors.primaryColor : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => onTabSelected(3),
                        tooltip: 'Profile',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
