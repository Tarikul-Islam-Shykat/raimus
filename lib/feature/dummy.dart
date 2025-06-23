// import 'package:flutter/material.dart';

// class PropertyDetailsScreen extends StatelessWidget {
//   const PropertyDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/bg.png'), // Your ImagePath.bg
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               devToSpace(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         'assets/images/state.png',
//                         height: 250,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                       // Gradient overlay for better text readability
//                       Container(
//                         height: 250,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Colors.transparent,
//                               Colors.black.withOpacity(0.7),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // Text overlay
//                       Positioned(
//                         bottom: 16,
//                         left: 16,
//                         right: 16,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Colony, New\nMexico 90210',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 height: 1.2,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Millsboro-DE',
//                                   style: TextStyle(
//                                     color: Colors.white70,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.star,
//                                       color: Colors.amber,
//                                       size: 16,
//                                     ),
//                                     const SizedBox(width: 4),
//                                     const Text(
//                                       '4.8',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Rest of your content continues here...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
