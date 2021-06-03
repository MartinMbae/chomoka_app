import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car/holders/recent_searches_holder.dart';
import 'package:flutter_car/models/recent_searches.dart';
import 'package:flutter_car/pages/available_buses_page.dart';
import 'package:flutter_car/utils/methods.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'package:searchable_dropdown/searchable_dropdown.dart';

class ExampleNumber {
  int number;

  static final Map<int, String> map = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
  };

  String get numberString {
    if (map.containsKey(number)){
      dynamic nn = map[number];
      if(nn == null){
        return "Null";
      }else{
        return nn ;
      }
    }else{
      return  "unknown";
    }
  }

  ExampleNumber(this.number);

  String toString() {
    return ("$number $numberString");
  }

  static List<ExampleNumber> get list {
    return (map.keys.map((num) {
      return (ExampleNumber(num));
    })).toList();
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 String selectedValue = "";
  String preselectedValue = "dolor sit";
  ExampleNumber selectedNumber = ExampleNumber(0);
  List<int> selectedItems = [];

  final List<DropdownMenuItem> items = [];


 late TextEditingController _controller1;

 String _valueChanged2 = '';
 String _valueToValidate2 = '';
 String _valueSaved2 = '';
 String _initialValue = '';

 List<RecentSearch> recentSearches = recentSearchLists;

  @override
  void initState() {
    items.add(DropdownMenuItem(
      child: Text("Mombasa"),
      value: "1",
    ));


    items.add(DropdownMenuItem(
      child: Text("Nairobi"),
      value: "2",
    ));


    items.add(DropdownMenuItem(
      child: Text("Kisumu"),
      value: "3",
    ));
    _initialValue = DateTime.now().toString();
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting();

    _controller1 = TextEditingController(text: DateTime.now().toString());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
       return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.grey.shade200,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children:[
                Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      color: Colors.blueAccent,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text("From:"),
                                  ),
                                  SearchableDropdown.single(
                                    items: items,
                                    value: selectedValue,
                                    hint: "Enter City/Town",
                                    searchHint: "Select Town/City",
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    isExpanded: true,
                                    displayClearIcon: false,
                                    icon: SizedBox(),
                                    underline: SizedBox(),


                                  ),
                                ],
                              ),
                            ),
                            Icon(CupertinoIcons.arrow_right_arrow_left, color: Colors.white, size: 28,),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text("To:"),
                                  ),
                                  SearchableDropdown.single(
                                    items: items,
                                    value: selectedValue,
                                    hint: "Enter City/Town",
                                    searchHint: "Select Town/City",
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    isExpanded: true,
                                    displayClearIcon: false,
                                    icon: SizedBox(),
                                    underline: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
                Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text("Departure Date:"),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                          child: DateTimePicker(
                                            type: DateTimePickerType.dateTime,
                                            dateMask: 'd MMMM, hh:mm a',
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                            icon: Icon(Icons.event),
                                            dateLabelText: 'Provide your expected departure date',
                                            use24HourFormat: false,
                                            locale: Locale('en', 'US'),
                                            onChanged: (val) => setState(() => _valueChanged2 = val),
                                            validator: (val) {
                                              setState(() => _valueToValidate2 = val ?? '');
                                              return null;
                                            },
                                            onSaved: (val) => setState(() => _valueSaved2 = val ?? ''),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),

                SizedBox(height: 20,),
                ElevatedButton.icon(onPressed: (){
                  navigateToPage(context, AvailableBusesPage());
                }, icon: Icon(Icons.search), label: Text("Search for Bus")),
                SizedBox(height: 20,),
                Divider(),
                Text("Recent Searches", style: Theme.of(context).textTheme.subtitle1,),
                Container(
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: ListView.builder(
                    itemCount: recentSearches.length,
                      itemBuilder: (context, index){
                    return RecentSearchHolder(
                      recentSearch: recentSearches[index],
                    );
                  },
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20,),
                Divider(),
              ]
            ),
          ),
        ),
      );
  }
}