import 'package:e_commerce_with_provider/services/models/shoes_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<String> bannerImg = [
    "assets/images/banner/banner_1.jpg",
    "assets/images/banner/banner_2.jpg",
    "assets/images/banner/banner_3.jpg",
  ];

  Map<String, String> brand = {
    'Adidas': 'assets/images/img_adidas.jpg',
    'Nike': 'assets/images/img_nike.png',
    'Reebok': 'assets/images/img_reebok.png',
    'Skechers': 'assets/images/img_skechers.png',
    'Puma ': 'assets/images/puma.png',
  };

  List<ShoesModel> MyFavList = [];

  void addToFav(ShoesModel addFav) {
    if (MyFavList.contains(addFav)) {
      MyFavList.removeWhere(
        (shoes) => shoes.name == addFav.name,
      );
    } else {
      MyFavList.add(addFav);
    }
    notifyListeners();
  }

  bool isFavShoes(ShoesModel item) {
    return MyFavList.contains(item);
  }
}
