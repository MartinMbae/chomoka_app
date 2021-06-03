import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BusLayoutPage extends StatefulWidget {
  @override
  _BusLayoutPageState createState() => _BusLayoutPageState();
}

class _BusLayoutPageState extends State<BusLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book a seat"),),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/images/bus/steering_wheel.png', width: 40, height: 40,),
            SizedBox(height: 40,),
            Image.asset('assets/images/bus/steering.png', width: 40, height: 40,),
            SizedBox(height: 40,),
            Icon(FontAwesomeIcons.bus),
            Icon(Icons.event_seat),
            Icon(Icons.event_seat_sharp),
            Icon(Icons.event_seat_outlined),
            Icon(Icons.event_seat_rounded),
          ],
        ),
      ),
    );
  }
}
