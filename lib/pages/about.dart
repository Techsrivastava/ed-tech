import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage('assets/images/logo.png'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Company Name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget urna eget quam tristique tristique ac et libero. Suspendisse potenti. Vivamus aliquam malesuada felis, at viverra massa venenatis nec. Proin semper augue id faucibus hendrerit. Nullam vel placerat lorem.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Add more widgets as needed
        ],
      ),
    );
  }
}
