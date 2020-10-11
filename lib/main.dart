import 'package:demo/PlayMovieTrailer/playMoviesTrailer.dart';

import './HomePage/movieDetail.dart';
import 'package:flutter/material.dart';

import './LandingPage/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeNavigation(),
      routes: {
        MovieDetails.routeName: (ctx) =>MovieDetails(),
        TrailerPlay.routeName: (ctx) => TrailerPlay(),
      },
    );
  }
}