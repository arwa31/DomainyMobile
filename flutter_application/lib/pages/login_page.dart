import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/registration_page.dart';

import '../cells/header_widget.dart';
import '../utils/theme_helper.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headHeight = 200;
  Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headHeight,
              // child: HeaderWidget(_headHeight, true ,Image.asset('images/log.png')),
              child: HeaderWidget(_headHeight, false, Icons.ac_unit_sharp),
            ),
            SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Signin into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            decoration: ThemeHelper().textInputDecoration(
                                'User Name', 'Enter your user name'),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              'Password', 'Enter your password'),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
                          alignment: Alignment.topRight,
                          child: Text("Forgot your password"),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Sign in'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(70, 100, 10, 10),
                          child: Row(
                            children: [
                              Text("Don't have an account ?  "),
                              GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage(),
                                      ),
                                    );
                                  }),
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00978E)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
