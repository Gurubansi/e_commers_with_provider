import 'package:e_commerce_with_provider/services/models/shoes_model.dart';
import 'package:e_commerce_with_provider/services/providers/home__provider.dart';
import 'package:e_commerce_with_provider/utils/CommonSizedBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("My Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          final favList = provider.MyFavList;

          if (favList.isEmpty) {
            return const Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              itemCount: favList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                ShoesModel shoes = favList[index];
                final isFav = provider.isFavShoes(shoes);

                return GestureDetector(
                  onTap: () {
                    // Optionally navigate to details
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => provider.addToFav(shoes),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Image.asset(
                              shoes.image,
                              height: 110,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            shoes.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            shoes.brand,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                shoes.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    shoes.rating,
                                    style: const TextStyle(fontSize: 13),
                                  ),
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
