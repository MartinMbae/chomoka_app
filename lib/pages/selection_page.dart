import 'package:flutter/material.dart';
import 'package:flutter_car/pages/auth_request_page.dart';
import 'package:flutter_car/pages/homepage.dart';
import 'package:flutter_car/utils/methods.dart';
import 'package:flutter_car/widgets/opacity_button.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            OpacityButton(
              callBack: goToBookBusPage,
              title: "Book a Bus",
              icon: Icon(Icons.directions_bus),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: OpacityButton(
                    title: "My Trips",
                    icon: Icon(Icons.calendar_today_outlined),
                    callBack: goToAuthRequestPage,
                  ),
                ),
                Expanded(
                  child: OpacityButton(
                    title: "My Wallet",
                    icon: Icon(Icons.money),
                    callBack: goToAuthRequestPage,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
   void goToAuthRequestPage(){
     navigateToPage(context, AuthRequestPage());
   }
   void goToBookBusPage(){
     navigateToPage(context, HomePage());
   }
}
