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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage('assets/images/logo.png'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Company Name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget urna eget quam tristique tristique ac et libero. Suspendisse potenti. Vivamus aliquam malesuada felis, at viverra massa venenatis nec. Proin semper augue id faucibus hendrerit. Nullam vel placerat lorem.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Add more widgets as needed
        ],
      ),
    );
  }
}
