import 'package:flutter/foundation.dart';

class AvailableBus {
  final int id, available_seats,price;
  final double ratings;
  final String 
      from,
      to,
      bus_company,

      bus_class,
      date,
      time,
      company_image;

  AvailableBus({
    required this.id,
    required this.from,
    required this.to,
    required this.ratings,
    required this.bus_company,
    required this.price,
    required this.bus_class,
    required this.date,
    required this.time,
    required this.available_seats,
    required this.company_image,
  });

  static AvailableBus fromJson(dynamic json) {
    return AvailableBus(
      id: json['id'],
      from: json['from'],
      to: json['to'],
      bus_company: json['bus_company'],
      price: json['price'],
      bus_class: json['class'],
      ratings: json['ratings'],
      date: json['date'],
      time: json['time'],
      available_seats: json['available_seats'],
      company_image: json['company_image'],
    );
  }
}

 List<AvailableBus> availableBusList =[
  AvailableBus(id: 1, from: "Nairobi", to: "Mombasa", date: '2nd March', time: "9:00PM", ratings: 2.3,  available_seats: 2,  bus_company: "Kenya Mpya", price: 500, bus_class: 'Normal Class', company_image: "https://nairobinews.nation.co.ke/wp-content/uploads/2019/04/Kenya-Mpya-Finale.jpg"),
  AvailableBus(id: 2, from: "Thika", to: "Makongeni", date: '22nd March', time: "10:00PM",  ratings: 4.0, available_seats: 1,  bus_company: "Lexus", price: 400,  bus_class: 'Normal Class', company_image: "https://malvabus.com/wp-content/uploads/2012/03/SDC10217-1024x768.jpg"),
  AvailableBus(id: 3, from: "Kisumu", to: "Eldoret",  date: '2nd March', time: "8:00PM", ratings: 2.0, available_seats: 9,  bus_company: "ENA Coach", price:1000,  bus_class: 'First Class', company_image: "https://3.bp.blogspot.com/-ADX8p6Cb-Nk/XDOEE2H6g6I/AAAAAAAAEkI/xIg-D5Z1j3YCJXG0wCpnFx7Xa-Tq-AIVACLcBGAs/s1600/ena%2Bcoach%252C.jpg"),
  AvailableBus(id: 4, from: "Mombasa", to: "Eldoret",  date: '2nd March', time: "9:00PM", ratings: 4.0, available_seats: 12,  bus_company: "Coast Bus", price: 4500, bus_class: 'Normal Class', company_image: "http://3.bp.blogspot.com/-IgC7pCmmc8k/WACyxt1iEiI/AAAAAAAAAfI/lToVVanKx10boQ42jXqlWK_BG2TeZdYygCK4B/s1600/Coasty.jpg"),
  AvailableBus(id: 5, from: "Mombasa", to: "Eldoret", date: '2nd March', time: "9:00PM",  ratings: 3.0,  available_seats: 2,  bus_company: "Simba", price: 1450, bus_class: 'First Class', company_image: "http://2.bp.blogspot.com/-eDO4EoTn_84/V_Nz_y9JclI/AAAAAAAAAY4/H0UNnGBl27kfbUoqb6PUs4vGuJoU0n6GQCK4B/s1600/13895480_638258049675426_6346412815953020421_n.jpg"),
  AvailableBus(id: 6, from: "Mombasa", to: "Eldoret",  date: '2nd March', time: "9:00PM", ratings: 2.7,  available_seats: 2,  bus_company: "Simba", price: 1450, bus_class: 'First Class', company_image: "http://2.bp.blogspot.com/-eDO4EoTn_84/V_Nz_y9JclI/AAAAAAAAAY4/H0UNnGBl27kfbUoqb6PUs4vGuJoU0n6GQCK4B/s1600/13895480_638258049675426_6346412815953020421_n.jpg"),
  AvailableBus(id: 7, from: "Mombasa", to: "Eldoret",  date: '2nd March', time: "9:00PM",  ratings: 4.3,  available_seats: 2,  bus_company: "Simba", price: 1450, bus_class: 'First Class', company_image: "http://2.bp.blogspot.com/-eDO4EoTn_84/V_Nz_y9JclI/AAAAAAAAAY4/H0UNnGBl27kfbUoqb6PUs4vGuJoU0n6GQCK4B/s1600/13895480_638258049675426_6346412815953020421_n.jpg"),
  AvailableBus(id: 8, from: "Mombasa", to: "Eldoret",  date: '2nd March', time: "9:00PM",  ratings: 4.7,  available_seats: 2,  bus_company: "Simba", price: 1450, bus_class: 'First Class', company_image: "http://2.bp.blogspot.com/-eDO4EoTn_84/V_Nz_y9JclI/AAAAAAAAAY4/H0UNnGBl27kfbUoqb6PUs4vGuJoU0n6GQCK4B/s1600/13895480_638258049675426_6346412815953020421_n.jpg"),
 ];
