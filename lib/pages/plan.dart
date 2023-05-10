import 'package:flutter/material.dart';
import 'package:leaning_app/pages/congrats_page.dart';
import 'package:leaning_app/pages/home.dart';
import 'package:leaning_app/pages/login.dart';
import 'package:leaning_app/widgets/custombutton.dart';
import 'package:sizer/sizer.dart';

class ChoosePlanPage extends StatelessWidget {
  late Color myButtonColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9),
        //   title: const Text('Choose Your Plan'),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(children: [
                  Text(
                    'Choose Your Plan',
                    style: TextStyle(fontSize: 19.sp),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      'Select your Subscription for Account activevation'),
                ])),
              ),
              Container(
                height: 15.h,
                width: 80.w,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'This is a trial plan activated for 7 days',
                        style: TextStyle(fontSize: 9.sp, color: Colors.grey),
                      ),
                      Text(
                        'This is a trial plan activated for 7 days',
                        style: TextStyle(fontSize: 5.sp, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 6.h,
                            width: 70.w,
                            child: CustomButton(
                              onPressed: () {
                               
                              },
                              title: const Text('&Days paln'),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 211, 163, 0.9),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CongratsPage(),
                              ));
                              },
                              child: const Text('Start'),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 29.h,
                width: 80.w,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '365 days Activation for Grade',
                        style: TextStyle(fontSize: 9.sp, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 15.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Grade'),
                                  Divider(),
                                  Text('Amount'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Grade '),
                                  Divider(),
                                  Text('Rate'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Grade'),
                                  Divider(),
                                  Text('Rate'),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text('Promo Code')),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Buy')),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Discount')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text('Cancel')),
            ],
          ),
        ));
  }
}
