// import 'package:flutter/material.dart';
//
// class AppBarWithDrawer extends StatelessWidget implements PreferredSizeWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   const AppBarWithDrawer({super.key, required this.scaffoldKey});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//         child: Row(
//           children: [
//
//             IconButton(
//               icon: Image.asset(
//                 'assets/icons/ic_menu.png',
//                 width: 25,
//                 height: 25,
//               ),
//               onPressed: () {
//                 scaffoldKey.currentState?.openDrawer(); // Open Drawer
//               },
//             ),
//
//             // Centered title
//             const Expanded(
//               child: Center(
//                 child: Text(
//                   'Brand Factory',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 23,
//                   ),
//                 ),
//               ),
//             ),
//
//             // Right side icons
//             Row(
//               children: [
//                 IconButton(
//                   icon: Image.asset(
//                     'assets/icons/ic_notification.png',
//                     width: 25,
//                     height: 25,
//                   ),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: const Icon(
//                     Icons.favorite_border,
//                     size: 28,
//                   ),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
