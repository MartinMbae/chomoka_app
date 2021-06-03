import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car/pages/homepage.dart';
import 'package:flutter_car/pages/otp_page.dart';
import 'package:flutter_car/utils/constants.dart';
import 'package:flutter_car/utils/methods.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class LoginPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Login to your account",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black87)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      Image.asset('assets/images/ke.png', height: 30, width: 30,),
                      SizedBox(width: 12,),
                      Text("+254", style: Theme.of(context).textTheme.subtitle1,),
                      SizedBox(width: 12,),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          maxLength: 10,
                          decoration: InputDecoration(labelText: "Phone number"),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Phone is required";
                            } else if (value.trim().length != 10) {
                              return "Phone must contain 10 digits";
                            } else if (!value.trim().startsWith('0')) {
                              return "Phone must start with 0";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(width: 4,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: RoundedLoadingButton(
                      child: Text('Login',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          requestCode(context, phoneController.text.trim());
                        }else{
                          _btnController.reset();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void requestCode(BuildContext buildContext, String phoneNumber) async {
    Timer(Duration(seconds: 3), () async{
      _btnController.reset();
      goToNextPageRemoveHistory(buildContext, HomePage());
    });
  }
}
