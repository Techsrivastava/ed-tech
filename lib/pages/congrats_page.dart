import 'package:flutter/material.dart';
import 'package:leaning_app/pages/login.dart';

class CongratsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9),
        title: Text('Congratulations!'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations! You did it!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/3374848_56739-removebg-preview.png',
              width: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
