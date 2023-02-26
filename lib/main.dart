import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    final rect = Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: size.width / 2,
    );
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
