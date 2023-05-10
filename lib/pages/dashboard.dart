import 'package:flutter/material.dart';
import 'package:leaning_app/pages/details.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> _subjects = [
    'Math',
    'Science',
    'English',
    'History',
    'Geography',
    'Art',
  ];

  List<bool> _subjectChecked = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(234, 205, 181, 0.9),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text(
                    'Hello 😃',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text('Welcome to App')
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Text(
                    'Plan: 7 Days Trial',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '7 Days left',
                    style: TextStyle(color: Colors.red),
                  )
                ]),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage('assets/images/7915189_3784896.jpg'),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Topics',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicPage(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/022-education-4.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Topic 1',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicPage(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/055-school.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Topic 2',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicPage(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/070-flasks-1.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Topic 3',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicPage(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/068-math.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Topic 4',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                   
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select Subjects',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
