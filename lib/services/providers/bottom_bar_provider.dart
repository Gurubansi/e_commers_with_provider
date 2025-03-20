import 'package:e_commerce_with_provider/view/home/add_to_cart_screen.dart';
import 'package:e_commerce_with_provider/view/home/favorite_screen.dart';
import 'package:e_commerce_with_provider/view/home/home_screen.dart';
import 'package:e_commerce_with_provider/view/home/profile_screen.dart';
import 'package:e_commerce_with_provider/view/home/search_screen.dart';
import 'package:flutter/widgets.dart';

class BottomBarProvider extends ChangeNotifier{
  int selectedIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const AddToCartScreen(),
    const ProfileScreen(),
  ];

  Widget get screens => _screens[selectedIndex];

  void onItemTapped(int index) {
      selectedIndex = index;
   notifyListeners();
  }

}