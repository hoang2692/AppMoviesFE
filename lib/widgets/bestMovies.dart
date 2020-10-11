import 'package:demo/HomePage/movieDetail.dart';
import 'package:demo/modal/movie.dart';
import 'package:flutter/material.dart';

class BestMovies extends StatelessWidget {
  final int i;
  BestMovies(this.i);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MovieDetails.routeName, arguments: {
          'id': movieList[i].id,
          'title': movieList[i].title,
          'imageUrl': movieList[i].imageUrl,
          'description': movieList[i].description,
          'rating': movieList[i].rating,
          'year': movieList[i].year,
          'duration': movieList[i].duration,
          'trailer': movieList[i].trailer
        });
      },
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movieList[i].imageUrl))),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(movieList[i].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 240, child: Text(movieList[i].description))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
