import 'package:flutter/material.dart';
import 'package:glass_morphic_lite/glass_morphic_lite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // A colorful background gradient to make the glass effect visible
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8EC5FC),
                    Color(0xFFE0C3FC),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Floating background circles to show the refraction through the glass
            Positioned(
              top: 150,
              left: 50,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: 40,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.tealAccent,
                ),
              ),
            ),
            // Center the glassmorphic card
            Center(
              child: GlassContainer(
                width: 300,
                height: 200,
                blur: 15,
                opacity:38,
                borderRadius: BorderRadius.circular(24),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 40,
                    ),
                    Spacer(),
                    Text(
                      'Glass Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Minimalist & Lightweight',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}