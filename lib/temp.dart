
// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   double rotation = 0.0;
//   double previousAngle = 0.0;
//   String selectedLanguage = 'English';
//   String selectedRegion = 'Upper Himachal';

//   void toggleLanguage() {
//     setState(() {
//       selectedLanguage = (selectedLanguage == 'English') ? 'Hindi' : 'English';
//     });
//   }

//   void toggleRegion() {
//     setState(() {
//       selectedRegion = (selectedRegion == 'Upper Himachal') ? 'Lower Himachal' : 'Upper Himachal';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: buildGestureDetector(),
//       bottomNavigationBar: buildBottomAppBar(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       title: const Text('Himachal Pradesh'),
//       actions: [
//         buildLanguageButtons(),
//       ],
//     );
//   }

//   Row buildLanguageButtons() {
//     return Row(
//       children: [
//         buildLanguageButton('English'),
//         buildLanguageButton('Hindi'),
//       ],
//     );
//   }

//   ElevatedButton buildLanguageButton(String language) {
//     return ElevatedButton(
//       onPressed: toggleLanguage,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: selectedLanguage == language ? const Color.fromARGB(255, 166, 173, 216) : Colors.grey,
//       ),
//       child: Text(language),
//     );
//   }

//   GestureDetector buildGestureDetector() {
//     return GestureDetector(
//       onPanUpdate: handlePanUpdate,
//       child: Center(
//         child: Stack(
//           children: [
//             buildBackgroundContainer(),
//             Center(
//               child: buildRotatingImage(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Container buildBackgroundContainer() {
//     return Container(
//       color: Colors.grey,
//       width: double.infinity,
//       height: double.infinity,
//       child: Image.asset(
//         ImagePaths.getBackgroundImagePath(selectedLanguage, selectedRegion),
//         fit: BoxFit.fitWidth,
//       ),
//     );
//   }

//   Transform buildRotatingImage() {
//     return Transform.rotate(
//       angle: rotation,
//       child: Image.asset(
//         ImagePaths.getRotatingImagePath(selectedLanguage, selectedRegion),
//         width: 290,
//         height: 290,
//       ),
//     );
//   }

//   BottomAppBar buildBottomAppBar() {
//     return BottomAppBar(
//       child: SizedBox(
//         width: double.infinity,
//         height: 60,
//         child: ElevatedButton(
//           onPressed: toggleRegion,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//           ),
//           child: const Text(
//             'Flip',
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void handlePanUpdate(DragUpdateDetails details) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final centerX = width / 2;
//     final centerY = height / 2;

//     final dx = details.localPosition.dx - centerX;
//     final dy = details.localPosition.dy - centerY;

//     final angle = atan2(dy, dx);

//     setState(() {
//       rotation += angle - previousAngle;
//       previousAngle = angle;
//     });
//   }
// }

// class ImagePaths {
//   static String getBackgroundImagePath(String language, String region) {
//     String basePath = 'assets/';

//     if (language == 'Hindi') {
//       basePath += 'hindi/';
//     } else {
//       basePath += 'english/';
//     }

//     if (region == 'Upper Himachal') {
//       print('${basePath}upper_background.png');
//       return '${basePath}upper_background.png';
//     } else {
//       print('${basePath}lower_background.png');
//       return '${basePath}lower_background.png';
//     }
//   }

//   static String getRotatingImagePath(String language, String region) {
//     String basePath = 'assets/';

//     if (language == 'Hindi') {
//       basePath += 'hindi/';
//     } else {
//       basePath += 'english/';
//     }

//     if (region == 'Upper Himachal') {
//       return '${basePath}rotating.png';
//     } else {
//       return '${basePath}upper_rotate.png';
//     }
//   }
// }
