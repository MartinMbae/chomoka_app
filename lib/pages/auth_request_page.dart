import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_car/pages/login_page.dart';
import 'package:flutter_car/pages/otp_page.dart';
import 'package:flutter_car/pages/phone_page.dart';
import 'package:flutter_car/utils/constants.dart';
import 'package:flutter_car/utils/methods.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthRequestPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black87),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                1.5 * appBar.preferredSize.height,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/logo_no_word.png'),
                SizedBox(
                  height: 20,
                ),
                Text(APP_NAME.toUpperCase(), style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black87, fontSize: 32)),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Login with Facebook"),
                      icon: Icon(
                        Icons.facebook,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF3B5998))),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Or"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: OutlinedButton(
                            onPressed: () {
                              navigateToPage(context, PhoneNumberPage());
                            }, child: Text("Sign Up"))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: OutlinedButton(
                            onPressed: () {
                              navigateToPage(context, LoginPage());
                            }, child: Text("Login"))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void requestCode(BuildContext buildContext, String phoneNumber) async {
    Timer(Duration(seconds: 3), () async {
      _btnController.reset();
      navigateToPage(
          buildContext,
          OtpPage(
            phoneNumber: phoneNumber,
          ));
    });
  }
}
