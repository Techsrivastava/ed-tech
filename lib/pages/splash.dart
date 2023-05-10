import 'package:flutter/material.dart';
import 'package:leaning_app/pages/registration.dart';
import 'package:leaning_app/widgets/custombutton.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<String> str = [
    "Anywhere, anytime give access to independent Learning",
    "Promotion of problem solving skills.",
    "Parent's Involement in education.",
    "Easy acces of homework and assignment online and offline",
    "Greate access to real-time."
  ];
  List<String> str1 = [
    "Assessing how student are interpretuing the concepts",
    "Asses whether students have memorized certion facts and details.",
    "Grading objectively without rater bias.",
    "Identify the weakest part of anytopic,",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(182, 234, 250, 10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Anywhere',
                          style: TextStyle(fontSize: 25.sp),
                        ),
                        const SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            color: Colors.black, //color of divider
                            width: 20, //width space of divider
                            thickness: 2, //thickness of divier line
                            indent: 20, //Spacing at the top of divider.
                            endIndent: 15, //Spacing at the bottom of divider.
                          ),
                        ),
                        Text(
                          'Anytime',
                          style: TextStyle(fontSize: 25.sp),
                        ),
                      ],
                    ),
                    Text(
                      'Personalized Learning',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      children: str.map((str) {
                        return Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\u2022",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ), //bullet text
                          const SizedBox(
                            width: 10,
                          ), //space between bullet and text
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                str,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ), //text
                          )
                        ]);
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/images/boy-learns-read-book-school_.png'),
                    )),
          // child:    CustomButton(title: const Text('Skipp'), onPressed: (){}),
                  ),
                ],
              ),
               CustomButton(title:  const Text('Skipp'), onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationPage(),));
               }),
            ]),
          ),
          Container(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(182, 234, 250, 10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Detailed Assessment',
                          style: TextStyle(fontSize: 25.sp),
                        ),
                      ],
                    ),
                    Text(
                      'In-depth Knowledge',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      children: str1.map((str1) {
                        return Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\u2022",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ), //bullet text
                          const SizedBox(
                            width: 10,
                          ), //space between bullet and text
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                str1,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ), //text
                          )
                        ]);
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/images/best-quality-guarantee-assurance-concept-removebg-preview.png'),
                    )),
                  ),
                   CustomButton(title:  const Text('Continew'), onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationPage(),));
                   }),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
