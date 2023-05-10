import 'package:flutter/material.dart';

class SelectSubjectPage extends StatelessWidget {
  final List<String> subjects = ['Maths', 'Science', 'English', 'Social Studies'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Subject'),
        backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to class materials page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassMaterialsPage(
                    subject: subjects[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                subjects[index],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ClassMaterialsPage extends StatelessWidget {
  final String subject;

  ClassMaterialsPage({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subject Materials'),
        backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9),
      ),
      body: Center(
        child: Text('$subject Materials'),
      ),
    );
  }
}
