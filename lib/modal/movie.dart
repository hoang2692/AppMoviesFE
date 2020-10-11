import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String rating;
  final String year;
  final String duration;
  final String trailer;

  Movie({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.rating,
    this.year,
    this.duration,
    this.trailer
  });

    factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      rating: json['rating'],
      year: json['year'],
      duration: json['duration'],
      trailer: json['trailer']
    );
  }

  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     id: json['id'],
  //     title: json['title'],
  //     imageUrl: json['imageUrl'],
  //     description: json['description'],
  //     rating: json['rating'],
  //     year: json['year'],
  //     duration: json['duration'],
  //     trailer: json['trailer']
  //   );
  // }
}




Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client.get('http://192.168.1.9/api/products');
  if(response.statusCode == 200)
  {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    final movies = mapResponse['data'].cast<Map<String, dynamic>>();
    final listofMovies = await movies.map<Movie>((json) {
      return Movie.fromJson(json);
    }).toList();
    return listofMovies;
  }
  else
  {
    throw Exception("Erro");
  }
}

final movieList = [
  Movie(
    id: '1',
    title: 'Avengers: Endgame',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/vi/e/e8/Avengers-Infinity_War-Official-Poster.jpg',
    description: 'Sau sự kiện Thanos làm cho một nửa vũ trụ tan biến và khiến cho biệt đội Avengers thảm bại, những siêu anh hùng sống sót phải tham gia trận chiến cuối cùng trong Avengers: Endgame.',
    rating: '8.6',
    year: '2019',
    duration: '181 min',
    trailer: 'https://r2---sn-8pxuuxa-nbozs.googlevideo.com/videoplayback?expire=1601325735&ei=R_ZxX8yvA5TerQSG8Y-gCg&ip=171.232.50.144&id=o-AOCKSXfGvyWKj_QgLiy4zJslo-oN_xoneHwXeetiFl2g&itag=18&source=youtube&requiressl=yes&mh=NC&mm=31%2C29&mn=sn-8pxuuxa-nbozs%2Csn-8pxuuxa-nbole&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=1025000&vprv=1&mime=video%2Fmp4&gir=yes&clen=15612123&ratebypass=yes&dur=226.789&lmt=1601114901420399&mt=1601304048&fvip=2&fexp=23915654&c=WEB&txp=5530422&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgLbtWRXNw59JE-v4aWx54m6kJLcuMlm3TGOJvHxrxG8ACIF38qZMdw4K4_MH9ELFnSB3DFEYcAco73lrBRz__gmnR&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAMsCuQOTfFXzjHf-03CGGKUqliWaLhfNGFTYiFFvkR-rAiEAyX37ZFRnvTQcYIXe7odwORGhwh3N38kFxBqfTHpJzC8%3D'
  ),
  Movie(
    id: '2',
    title: 'TENET',
    imageUrl: 'http://image.phimmoizz.net/film/11048/poster.medium.jpg',
    description: 'Phim theo chân một tổ chức gián điệp bí ẩn có khả năng thao túng và nghịch đảo thời gian, thực thi sứ mệnh ngăn chặn Thế chiến thứ III từ trước khi nó xảy ra.',
    rating: '7.6',
    year: '2020',
    duration: '150 min'
  ),
  Movie(
    id: '3',
    title: 'The Night Clerk',
    imageUrl: 'http://image.phimmoizz.net/film/10490/poster.medium.jpg',
    description: 'Bart tạo mối liên hệ cá nhân với một vị khách xinh đẹp tên Andrea, nhưng anh sớm nhận ra mình phải ngăn chặn kẻ giết người thực sự trước khi Andrea trở thành nạn nhân tiếp theo.',
    rating: '7.6',
    year: '2020',
    duration: '90 min'
  ),
  Movie(
    id: '4',
    title: 'Annihilation',
    imageUrl: 'http://image.phimmoizz.net/film/6376/poster.medium.jpg',
    description: 'Người chồng của một nhà sinh vật học đột ngột biến mất. Cô quyết định cùng với bốn nhà nghiên cứu khoa học nữ khác đi vào một vùng thiên tai, nơi mà các quy luật khoa học thông thường là vô nghĩa.',
    rating: '7.6',
    year: '2018',
    duration: '115 min'
  ),
  Movie(
    id: '5',
    title: 'Rogue',
    imageUrl: 'http://image.phimmoizz.net/film/11383/poster.medium.jpg',
    description: 'BIỆT ĐỘI SĂN MỒI là hành trình sống còn của nhóm lính đánh thuê, được giao nhiệm vụ giải cứu con gái một nhà lãnh đạo cấp cao khỏi âm mưu của nhóm buôn người.',
    rating: '7.6',
    year: '2020',
    duration: '150 min'
  ),
];
