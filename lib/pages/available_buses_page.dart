import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car/holders/available_bus_holder.dart';
import 'package:flutter_car/models/available_bus.dart';

class AvailableBusesPage extends StatefulWidget {
  @override
  _AvailableBusesState createState() => _AvailableBusesState();
}

class _AvailableBusesState extends State<AvailableBusesPage> {

  List<AvailableBus> availableBusesList = availableBusList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 24),
          itemCount: availableBusesList.length,
          itemBuilder: (context, index){
            return AvailableBusHolder(
              availableBus: availableBusesList[index],
            );
          },
          shrinkWrap: true,
        ),
      ),

    );
  }
}
