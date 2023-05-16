import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:leaning_app/config.dart';
import 'package:leaning_app/pages/home.dart';
import 'package:leaning_app/pages/registration.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   // Define the form key and text editing controllers for email and password fields
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoggingIn = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedpref();
  }

  void initSharedpref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async{
     if ( emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
           var reqBody = {
        "email": emailController.text,
        "password": passwordController.text,
      };
        var response = await http.post(
        Uri.parse(login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(reqBody),
      );

       var jsonResponse = jsonDecode(response.body);
       if(jsonResponse['status']){
        //navigate to home page
        var myToken = jsonResponse['token'];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>HomePage(),
            )
            );
        prefs.setString("token", 'myToken');
       }else{
        print("Something went wrong");
       }
        }
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Think Mind'),
            backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9)),
        body: Column(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 50.0),
                      const Text(
                        'Login your Account',
                        style: TextStyle(fontSize: 32.0),
                      ),
                     const SizedBox(height: 50.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: '  Email',border: InputBorder.none
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration:
                              const InputDecoration(labelText: '  Password',border: InputBorder.none),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                           loginUser();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Text(
                              'login',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ));
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Create Your Account',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'forget your Password',
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}