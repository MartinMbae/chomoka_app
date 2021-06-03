import 'package:flutter/foundation.dart';

class RecentSearch {
  final id,
      from,
      to,
      bus_company,
      date_searched,
      company_image;

  RecentSearch({
    @required this.id,
    @required this.from,
    @required this.to,
    @required this.bus_company,
    @required this.date_searched,
    @required this.company_image,
  });

  static RecentSearch fromJson(dynamic json) {
    return RecentSearch(
      id: json['id'],
      from: json['from'],
      to: json['to'],
      bus_company: json['bus_company'],
      date_searched: json['date_searched'],
      company_image: json['company_image'],
    );
  }
}

 List<RecentSearch> recentSearchLists =[
  RecentSearch(id: 1, from: "Nairobi", to: "Mombasa", bus_company: "Kenya Mpya", date_searched: "24th June 2020", company_image: "https://nairobinews.nation.co.ke/wp-content/uploads/2019/04/Kenya-Mpya-Finale.jpg"),
  RecentSearch(id: 2, from: "Thika", to: "Makongeni", bus_company: "Lexus", date_searched: "26th June 2020", company_image: "https://malvabus.com/wp-content/uploads/2012/03/SDC10217-1024x768.jpg"),
  RecentSearch(id: 3, from: "Kisumu", to: "Eldoret", bus_company: "ENA Coach", date_searched: "29th June 2020", company_image: "https://3.bp.blogspot.com/-ADX8p6Cb-Nk/XDOEE2H6g6I/AAAAAAAAEkI/xIg-D5Z1j3YCJXG0wCpnFx7Xa-Tq-AIVACLcBGAs/s1600/ena%2Bcoach%252C.jpg"),
  RecentSearch(id: 4, from: "Mombasa", to: "Eldoret", bus_company: "Coast Bus", date_searched: "29th June 2020", company_image: "http://3.bp.blogspot.com/-IgC7pCmmc8k/WACyxt1iEiI/AAAAAAAAAfI/lToVVanKx10boQ42jXqlWK_BG2TeZdYygCK4B/s1600/Coasty.jpg"),
  RecentSearch(id: 5, from: "Mombasa", to: "Eldoret", bus_company: "Simba", date_searched: "29th June 2020", company_image: "http://2.bp.blogspot.com/-eDO4EoTn_84/V_Nz_y9JclI/AAAAAAAAAY4/H0UNnGBl27kfbUoqb6PUs4vGuJoU0n6GQCK4B/s1600/13895480_638258049675426_6346412815953020421_n.jpg"),
 ];
