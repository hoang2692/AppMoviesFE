import 'dart:convert';
import 'dart:async';

import '../modal/movie.dart';

import '../widgets/carousel.dart';

import '../widgets/bestMovies.dart';

import '../widgets/slideWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String rating;
  final String year;
  final String duration;
  final String trailer;
  final String movie;

  User(
      this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.rating,
      this.year,
      this.duration,
      this.trailer,
      this.movie
  ); 
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  Future<List<User>> _getData() async {
    var data = await http.get("http://localhost:3000/movies/news");
    var jsonData = json.decode(data.body);
      List<User> users = [];
      for ( var u in jsonData)
      {
        User user = User(
          u["id"],
          u["title"],
          u["imageUrl"],
          u["description"],
          u["rating"],
          u["year"],
          u["duration"],
          u["trailer"],
          u["movie"]
        );
        users.add(user);
      }
      print(users.length);
      return users;
  }
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Carousel(),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Gợi ý dành cho bạn",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(onPressed: () {}, child: Text("View All"))
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 280,
              child: FutureBuilder(
                future: _getData(),
                builder: (BuildContext context,AsyncSnapshot snapshot)
                {
                  if(snapshot.data == null)
                  {
                    return Center(
                    child: CircularProgressIndicator(),
                    );
                  }
                  else
                  {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, i) => Slide(i),
              );
                  } 
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Nổi bật trong ngày",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(onPressed: () {}, child: Text("View All"))
                  ],
                )),
            Container(
              height: 510,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => BestMovies(i),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Phim chiếu rạp",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(onPressed: () {}, child: Text("View All"))
                  ],
                )),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   height: 280,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: movieList.length,
            //     itemBuilder: (ctx, i) => SlideWidget(i),
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Phim lẻ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(onPressed: () {}, child: Text("View All"))
                  ],
                )),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   height: 280,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: movieList.length,
            //     itemBuilder: (ctx, i) => SlideWidget(i),
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text("Đắm mình vào thế giới Anime",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             )),
            //         FlatButton(onPressed: () {}, child: Text("View All"))
            //       ],
            //     )),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   height: 280,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: movieList.length,
            //     itemBuilder: (ctx, i) => SlideWidget(i),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
