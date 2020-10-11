import 'package:demo/PlayMovieTrailer/playMoviesTrailer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';

class MovieDetails extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        print(routeArgs);
    final rating = routeArgs['rating'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(routeArgs['imageUrl']))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(routeArgs['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 45,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              routeArgs['duration'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              size: 45,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              routeArgs['year'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.star_border,
                              size: 45,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$rating/10',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                routeArgs['description'],
                style: TextStyle(fontSize: 20, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                child: Center(
                  child: Chewie(
                    controller: ChewieController(
                        videoPlayerController:
                            VideoPlayerController.network("https://firebasestorage.googleapis.com/v0/b/api-demo-9205f.appspot.com/o/CH%E1%BA%A0NH%20L%C3%92NG%20TH%C6%AF%C6%A0NG%20C%C3%94%20(Official%20MV)%20_%20Huy%20V%E1%BA%A1c%20ft%20Non%20Hanta%20(Prod%20H%C6%B0ng%20Hack).mp4?alt=media&token=af5e4bb5-a5fa-4631-8702-27e234fd6a2e"),
                        aspectRatio: 3 / 2,
                        looping: true,
                        autoPlay: false,
                        autoInitialize: true,
                        allowedScreenSleep: false),
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(TrailerPlay.routeName, arguments: {
                  'id': routeArgs['id'],
                  'title': routeArgs['title'],
                  'imageUrl': routeArgs['imageUrl'],
                  'description': routeArgs['description'],
                  'rating': routeArgs['rating'],
                  'year': routeArgs['year'],
                  'duration': routeArgs['duration'],
                  'trailer': routeArgs['trailer'],
                });
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.play_circle_outline),
                  Text(
                    'Xem Phim',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Quan tâm',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
