import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_with_provider/services/models/shoes_model.dart';
import 'package:e_commerce_with_provider/services/providers/home__provider.dart';
import 'package:e_commerce_with_provider/utils/CommonSizedBox.dart';
import 'package:e_commerce_with_provider/view/home/add_to_cart_screen.dart';
import 'package:e_commerce_with_provider/view/home/bottom_bar.dart';
import 'package:e_commerce_with_provider/view/home/favorite_screen.dart';
import 'package:e_commerce_with_provider/view/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
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
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => Get.to(ProfileScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Get.to(HomeScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.logout_sharp),
              title: const Text('Logout'),
              onTap: () => Get.to(HomeScreen()),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.grey.shade100,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
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
                IconButton(
                  icon: Image.asset(
                    'assets/icons/ic_notification.png',
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                ),
              ),
            ),
          ),

          // Remaining content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  boxH20(),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: homeProvider.bannerImg.map((imgPath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                BoxDecoration(color: Colors.grey.shade200),
                            child: Image.asset(
                              imgPath,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  boxH10(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      children: [
                        Text(
                          'Top Brands',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  boxH10(),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.brand.length,
                      itemBuilder: (context, index) {
                        String brandName =
                            homeProvider.brand.keys.elementAt(index);
                        String imagePath = homeProvider.brand[brandName]!;
                        return Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  brandName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  boxH15(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: shoesList.length,
                    itemBuilder: (context, index) {
                      ShoesModel shoes = shoesList[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () => homeProvider.addToFav(shoes),
                                    child: Icon(homeProvider.isFavShoes(shoes) ?Icons.favorite : Icons.favorite_border,
                                        color: homeProvider.isFavShoes(shoes) ? Colors.red : Colors.grey.shade600)),
                              ),
                              Center(
                                child: Image.asset(
                                  shoes.image,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                shoes.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                shoes.brand,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    shoes.price,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      const SizedBox(width: 4),
                                      Text(shoes.rating),
                                    ],
                                  ),
                                ],
                              ),
                              boxH05(),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: ElevatedButton(
                                    onPressed: () {

                                }, style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: Colors.red,
                                ),
                                    child:const Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
