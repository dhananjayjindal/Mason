import 'dart:math';
import 'package:flutter/material.dart';

import 'compo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rotation = 0.0;
  double previousAngle = 0.0;
  String selectedLanguage = 'English';
  String selectedRegion = 'Upper Himachal';

  @override
  Widget build(BuildContext context) {
    // final bool isPhone = MediaQuery.of(context).size.width < 600;
    final bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;
    final bool isWeb = MediaQuery.of(context).size.width >= 1200;
    // double x = MediaQuery.of(context).size.width;
    // double y = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Himachal Pradesh'),
        actions: [
          ElevatedButton(
            onPressed: toggleLanguage,
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedLanguage == 'English' ? const Color.fromARGB(255, 255, 255, 255) : Colors.grey,
            ),
            child: const Text('English'),
          ),
          ElevatedButton(
            onPressed: toggleLanguage,
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedLanguage == 'Hindi' ? const Color.fromARGB(255, 255, 255, 255) : Colors.grey,
            ),
            child: const Text('Hindi'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;
              final centerX = width / 2;
              final centerY = height / 2;
              final dx = details.localPosition.dx - centerX;
              final dy = details.localPosition.dy - centerY;
              final angle = atan2(dy, dx);
              setState(() {
                rotation += angle - previousAngle;
                previousAngle = angle;
              });
            },
            child: Center(
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      getImagePath(selectedLanguage, selectedRegion),
                      // width: isWeb ? 350 : (isTablet ? 250 : (isPhone ? 150 : 100)),
                      // height: isWeb ? 350 : (isTablet ? 250 : (isPhone ? 150 : 100)),
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                  Transform.rotate(
                    angle: rotation,
                    child: Center(
                      child: Image.asset(
                        getRotatingImagePath(selectedLanguage, selectedRegion),
                        width: isWeb ? 800 : (isTablet ? 600 : 283),
                        height: isWeb ? 800 : (isTablet ? 600 : 283),
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: toggleRegion,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text(
              'Flip',
              style: TextStyle(
                fontSize: isWeb ? 24 : (isTablet ? 18 : 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggleLanguage() {
    setState(() {
      selectedLanguage = (selectedLanguage == 'English') ? 'Hindi' : 'English';
    });
  }

  void toggleRegion() {
    setState(() {
      selectedRegion = (selectedRegion == 'Upper Himachal') ? 'Lower Himachal' : 'Upper Himachal';
    });
  }
}
