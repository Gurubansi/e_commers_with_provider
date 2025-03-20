import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Brand Factory'),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Image.asset(
                'assets/icons/ic_menu.png',
                width: 25,
                height: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/ic_notification.png',
              width: 25,
              height: 25,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              size: 28,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
    );
  }
}
