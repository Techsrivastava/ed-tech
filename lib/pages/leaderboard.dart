import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        children: [
          Text(
            'Top Performers',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/1.jpg',
                ),
              ),
              title: Text('John Doe'),
              trailing: Text('1000 pts'),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/2.jpg',
                ),
              ),
              title: Text('Jane Smith'),
              trailing: Text('800 pts'),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/3.jpg',
                ),
              ),
              title: Text('Jack Brown'),
              trailing: Text('600 pts'),
            ),
          ),
        ],
      ),
    );
  }
}
