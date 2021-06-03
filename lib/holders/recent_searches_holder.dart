import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car/models/recent_searches.dart';

class RecentSearchHolder extends StatelessWidget {


  final RecentSearch recentSearch;

  const RecentSearchHolder({Key? key, required this.recentSearch}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String heroTag = "imageHero${recentSearch.id}";
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          children: [
            GestureDetector(
                child: Hero(
                  tag: heroTag,
                  child:Image.network(
                    recentSearch.company_image,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                    // height: 180,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SingleImageScreen(
                        tag: heroTag,
                        imageUrl: recentSearch.company_image);
                  }));
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(recentSearch.from, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12), maxLines: 1,),
                Icon(Icons.arrow_forward_ios, size: 12,),
                Text(recentSearch.to, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12), maxLines: 1,),
              ],
            ),
            Text(recentSearch.date_searched, maxLines: 1,),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    );
  }
}

class SingleImageScreen extends StatelessWidget {
  final imageUrl, tag;

  const SingleImageScreen({Key? key, @required this.imageUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Hero(
            tag: tag,
            child: Image.network(
              imageUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}