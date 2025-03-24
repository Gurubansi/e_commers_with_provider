import 'package:e_commerce_with_provider/utils/CommonSizedBox.dart';
import 'package:e_commerce_with_provider/view/home/add_to_cart_screen.dart';
import 'package:e_commerce_with_provider/view/home/bottom_bar.dart';
import 'package:e_commerce_with_provider/view/home/favorite_screen.dart';
import 'package:e_commerce_with_provider/view/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Brand Factory',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.to(BottomBar());
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () => Get.to(const FavoriteScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () => Get.to(AddToCartScreen()),
            ),ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () =>  Get.to(ProfileScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () =>  Get.to(HomeScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.logout_sharp),
              title: const Text('Logout'),
              onTap: () =>  Get.to(HomeScreen()),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            /// app header
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    // Left side menu icon
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/ic_menu.png',
                        width: 25,
                        height: 25,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          'Brand Factory',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/ic_notification.png',
                            width: 25,
                            height: 25,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            boxH15(),
            /// search box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Inner padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                      ),
                    ),
                  ),
                ],
              ),
            )
            /// add banner


          ],
        ),
      ),
    );
  }
}
