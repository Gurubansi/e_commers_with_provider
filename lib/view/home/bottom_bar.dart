import 'package:e_commerce_with_provider/services/providers/bottom_bar_provider.dart';
import 'package:e_commerce_with_provider/view/home/add_to_cart_screen.dart';
import 'package:e_commerce_with_provider/view/home/favorite_screen.dart';
import 'package:e_commerce_with_provider/view/home/home_screen.dart';
import 'package:e_commerce_with_provider/view/home/profile_screen.dart';
import 'package:e_commerce_with_provider/view/home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: provider.screens, // Display the selected screen
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0,context),
              _buildNavItem(Icons.search, 'Search', 1,context),
              _buildNavItem(Icons.favorite, 'Favorite', 2,context),
              _buildNavItem(Icons.shopping_cart, 'Cart', 3,context),
              _buildNavItem(Icons.person, 'Profile', 4,context),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Helper method to build each navigation item
  Widget _buildNavItem(IconData icon, String label, int index,BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);

    return GestureDetector(
      onTap: () => provider.onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,size: 23,
            color: provider.selectedIndex == index
                ? (provider.selectedIndex == 2 ? Colors.red : Colors.white)
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: provider.selectedIndex == index ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}