import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final format_string =  new NumberFormat("#,##0", "en_US");

Future goToNextPageRemoveHistory(BuildContext context,  Widget newRoute) async {
  return await Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => newRoute), (route) => false);
}

Future navigateToPage(context, page) async {
  await Navigator.push(
      context, MaterialPageRoute(builder: (context) => page));
}