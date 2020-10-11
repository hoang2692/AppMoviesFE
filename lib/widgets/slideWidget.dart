import 'dart:convert';
import 'dart:async';
import 'package:demo/HomePage/movieDetail.dart';
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

  User(this.id, this.title, this.imageUrl, this.description, this.rating,
      this.year, this.duration, this.trailer, this.movie);
}

class Slide extends StatefulWidget {
  final int i;
  Slide(this.i);
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  // ignore: missing_return
  Future<List<User>> _getData() async {
    var data = await http.get("http://localhost:3000/movies/news");
    if (data.statusCode == 200) {
      // print("Connect Success!");
      var jsonData = json.decode(data.body);
      List<User> users = [];
      for (var u in jsonData) {
        User user = User(u["id"], u["title"], u["imageUrl"], u["description"],
            u["rating"], u["year"], u["duration"], u["trailer"], u["movie"]);
        users.add(user);
      }
      return users;
    } else {
      // print("Connect Fail!!");
    }
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 280,
      width: 150,
      child: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MovieDetails.routeName, arguments: {
                      'id': snapshot.data[widget.i].id,
                      'title': snapshot.data[widget.i].title,
                      'imageUrl': snapshot.data[widget.i].imageUrl,
                      'description': snapshot.data[widget.i].description,
                      'rating': snapshot.data[widget.i].rating,
                      'year': snapshot.data[widget.i].year,
                      'duration': snapshot.data[widget.i].duration,
                      'trailer': snapshot.data[widget.i].trailer
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(snapshot.data[widget.i].imageUrl),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data[widget.i].title,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ));
          }
        },
      ),
    );
  }
}
