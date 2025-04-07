import 'package:flutter/material.dart';

class ShoesModel {
  final String name;
  final String brand;
  final String price;
  final String rating;
  final String styleType;
  final List<Color> colors;
  final List<double> sizes;
  final String description;
  final String image;

  ShoesModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.styleType,
    required this.colors,
    required this.sizes,
    required this.description,
    required this.image,
  });
}

List<ShoesModel> shoesList = [
  ShoesModel(
    name: "Air Max Alpha",
    brand: "Nike",
    price: "₹6,999",
    rating: "4.5",
    styleType: "Running",
    colors: [Colors.black, Colors.white],
    sizes: [7, 8, 9, 10],
    description: "Comfortable running shoes with breathable mesh and solid grip.",
    image: "assets/images/shoes/nike1.png",
  ),
  ShoesModel(
    name: "Ultraboost 22",
    brand: "Adidas",
    price: "₹8,499",
    rating: "4.7",
    styleType: "Training",
    colors: [Colors.blue, Colors.grey],
    sizes: [6, 7, 8, 9, 10, 11],
    description: "High-performance training shoes with responsive cushioning.",
    image: "assets/images/shoes/adidas1.png",
  ),
  ShoesModel(
    name: "Nano X3",
    brand: "Reebok",
    price: "₹5,499",
    rating: "4.4",
    styleType: "Crossfit",
    colors: [Colors.red, Colors.black],
    sizes: [8, 9, 10],
    description: "Engineered for versatility, perfect for workouts and cardio.",
    image: "assets/images/shoes/reebok1.png",
  ),
  ShoesModel(
    name: "Zoom Fly 5",
    brand: "Nike",
    price: "₹10,999",
    rating: "4.6",
    styleType: "Marathon",
    colors: [Colors.orange, Colors.white],
    sizes: [9, 10, 11],
    description: "Built for long-distance running with superior cushioning.",
    image: "assets/images/shoes/nike2.png",
  ),
  ShoesModel(
    name: "Forum Low",
    brand: "Adidas",
    price: "₹7,299",
    rating: "4.2",
    styleType: "Casual",
    colors: [Colors.white, Colors.black],
    sizes: [6, 7, 8],
    description: "Classic silhouette with a modern twist, great for casual wear.",
    image: "assets/images/shoes/adidas2.png",
  ),
  ShoesModel(
    name: "Classic Leather",
    brand: "Reebok",
    price: "₹4,999",
    rating: "4.3",
    styleType: "Lifestyle",
    colors: [Colors.grey, Colors.white],
    sizes: [7, 8, 9, 10],
    description: "Retro design meets modern comfort, suitable for daily use.",
    image: "assets/images/shoes/reebok2.png",
  ),
  ShoesModel(
    name: "Air Jordan 1",
    brand: "Nike",
    price: "₹12,499",
    rating: "4.9",
    styleType: "Basketball",
    colors: [Colors.red, Colors.black],
    sizes: [8, 9, 10, 11],
    description: "Iconic basketball shoes with premium leather and support.",
    image: "assets/images/shoes/nike3.png",
  ),
  ShoesModel(
    name: "ZX 2K Boost",
    brand: "Adidas",
    price: "₹9,599",
    rating: "4.5",
    styleType: "Sportswear",
    colors: [Colors.green, Colors.black],
    sizes: [6, 7, 8, 9],
    description: "Sleek design with Boost cushioning for all-day wear.",
    image: "assets/images/shoes/adidas3.png",
  ),

];

