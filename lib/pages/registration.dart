import 'package:flutter/material.dart';
import 'package:leaning_app/pages/login.dart';
import 'package:leaning_app/pages/plan.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:leaning_app/config.dart';
import 'dart:convert';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final gradeController = TextEditingController();

  final boardController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isRegistering = false;

  void registerUser() async {
    if (nameController.text.isNotEmpty &&
        gradeController.text.isNotEmpty &&
        boardController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var regBody = {
        "name": nameController.text,
        "grade": gradeController.text,
        "board": boardController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      var response = await http.post(
        Uri.parse(registration),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);
      if (jsonResponse['status']) {
        //yaha pr login aa jaye

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChoosePlanPage(),
            ));
      } else {
        print("Something Went Wrong");
      }
    } else {
      setState(() {
        _isRegistering = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                        'Create your Account',
                        style: TextStyle(fontSize: 32.0),
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
                          controller: nameController,
                          decoration: const InputDecoration(labelText: '   Name',border: InputBorder.none,),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your current class';
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
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(labelText: '  Board',border: InputBorder.none,),
                          value: boardController.text.isNotEmpty
                              ? boardController.text
                              : null,
                          onChanged: (value) {
                            boardController.text = value.toString();
                          },
                          items: <String>[
                            'State Board',
                            'CBSE',
                            'ICSE',
                            'IB Board',
                            'IGCSE',
                            'Other',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(labelText: '  Grade',border: InputBorder.none),
                          value: gradeController.text.isNotEmpty
                              ? gradeController.text
                              : null,
                          onChanged: (value) {
                            gradeController.text = value.toString();
                          },
                          items: <String>[
                            '1st Grade',
                            '2nd Grade',
                            '3rd Grade',
                            '4th Grade',
                            '5th Grade',
                            '6th Grade',
                            '7th Grade',
                            '8th Grade',
                            '9th Grade',
                            '10th Grade',
                            '11th Grade',
                            '12th Grade',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                            registerUser();
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
                              'REGISTER',
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
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: const Center(
                          child: Text(
                            'Already have an account? Login',
                            style: TextStyle(fontSize: 18.0),
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
