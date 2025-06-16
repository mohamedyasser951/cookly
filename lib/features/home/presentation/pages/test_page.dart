// import 'package:flutter/material.dart';
// import 'package:page_flip/page_flip.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = GlobalKey<PageFlipWidgetState>();

//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           PageFlipWidget(
//             key: controller,
//             backgroundColor: Colors.white,
//             lastPage: Container(
//               color: Colors.white,
//               child: const Center(child: Text('Last Page!')),
//             ),
//             children: <Widget>[for (var i = 0; i < 5; i++) DemoPage(page: i)],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   child: const Icon(Icons.arrow_back_ios),
//                   onPressed: () {
//                     controller.currentState?.previousPage();
//                   },
//                 ),
//                 const SizedBox(width: 10),

//                 FloatingActionButton(
//                   child: const Icon(Icons.arrow_forward_ios),
//                   onPressed: () {
//                     controller.currentState?.nextPage();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class DemoPage extends StatefulWidget {
//   final int page;

//   const DemoPage({super.key, required this.page});

//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }

// class _DemoPageState extends State<DemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//           child: ListView(
//             children: [
//               Center(
//                 child: Text(
//                   "Catalog - Part ${widget.page + 1}",
//                   style: const TextStyle(
//                     fontSize: 24.0,
//                     decoration: TextDecoration.underline,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12.0),
//               _buildCatalogCard(
//                 image: const Placeholder(fallbackHeight: 180),
//                 title: "A New Beginning",
//                 description:
//                     "Elmer Elevator and his mother once ran a cheerful little candy shop in their hometown. But when the town's people moved away, so did their customers—and their dreams. Forced to relocate to a distant city, they hoped for a fresh start, but life there proved harder than expected. As money ran out, so did their options.",
//               ),
//               _buildCatalogCard(
//                 image: const Placeholder(fallbackHeight: 180),
//                 title: "The Mysterious Cat",
//                 description:
//                     "Feeling hopeless, Elmer finds comfort in a stray cat with an unusual ability: it talks. The cat tells Elmer of a magical island where a young dragon is being held captive. The dragon, it claims, could change everything. Inspired by the tale, Elmer sets out on a daring journey to find the dragon and rewrite his destiny.",
//               ),
//               _buildCatalogCard(
//                 image: const Placeholder(fallbackHeight: 180),
//                 title: "The Dragon's Secret",
//                 description:
//                     "With the help of a bubbly whale named Soda, Elmer arrives at Wild Island—a wild, untamed place ruled by animals and fear. There, he meets Boris, a kind-hearted but clumsy dragon held prisoner by the island's leader, Saiwa the gorilla. As Elmer helps Boris escape, they embark on an adventure to heal his broken wing and unlock the truth about Boris’s purpose.",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCatalogCard({
//     required Widget image,
//     required String title,
//     required String description,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 12.0),
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(borderRadius: BorderRadius.circular(8.0), child: image),
//             const SizedBox(height: 12.0),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(description, style: const TextStyle(fontSize: 14.0)),
//           ],
//         ),
//       ),
//     );
//   }
// }
