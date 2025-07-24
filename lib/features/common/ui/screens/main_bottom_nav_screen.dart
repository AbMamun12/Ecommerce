import 'package:e_commerce/features/category/ui/screens/category_list_screen.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name ='/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget>_screens = const[
   HomeScreen(),
    CategoryListScreen(),
    HomeScreen(),
    HomeScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex ,
            onDestinationSelected: bottomNavController.changedIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      }
    );
  }
}
