import 'package:chewie/chewie.dart';
import 'package:demo/PlayMovieTrailer/recommend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerPlay extends StatefulWidget {
  static const routeName = '/trailersMovie';
  TrailerPlay({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<TrailerPlay> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  
  String trailer;

  @override
  void initState() {
    super.initState(); 
    _videoPlayerController1 = VideoPlayerController.network(
        'https://r2---sn-8pxuuxa-nbozs.googlevideo.com/videoplayback?expire=1601325735&ei=R_ZxX8yvA5TerQSG8Y-gCg&ip=171.232.50.144&id=o-AOCKSXfGvyWKj_QgLiy4zJslo-oN_xoneHwXeetiFl2g&itag=18&source=youtube&requiressl=yes&mh=NC&mm=31%2C29&mn=sn-8pxuuxa-nbozs%2Csn-8pxuuxa-nbole&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=1025000&vprv=1&mime=video%2Fmp4&gir=yes&clen=15612123&ratebypass=yes&dur=226.789&lmt=1601114901420399&mt=1601304048&fvip=2&fexp=23915654&c=WEB&txp=5530422&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgLbtWRXNw59JE-v4aWx54m6kJLcuMlm3TGOJvHxrxG8ACIF38qZMdw4K4_MH9ELFnSB3DFEYcAco73lrBRz__gmnR&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAMsCuQOTfFXzjHf-03CGGKUqliWaLhfNGFTYiFFvkR-rAiEAyX37ZFRnvTQcYIXe7odwORGhwh3N38kFxBqfTHpJzC8%3D');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
      autoInitialize: true
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    trailer = routeArgs['trailer'];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routeArgs['title'],
            style: TextStyle(color: Colors.green),
          ),
          leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Color(0xff4f4f4),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: (BorderRadius.circular(5)),
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(routeArgs['imageUrl']))),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          routeArgs['title'],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    ButtonTheme(
                      minWidth: 10,
                      buttonColor: Colors.white,
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Có thể bạn thích",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Recommend(),
                      Recommend(),
                      Recommend(),
                      Recommend()
                    ],
                  )),
            ],
          ),
        ));
  }
}

// // class TrailerPlay extends StatefulWidget {
// //   static const routeName = '/trailersMovie';
// //   TrailerPlay({this.title = 'Chewie Demo'});

// //   final String title;

// //   @override
// //   State<StatefulWidget> createState() {
// //     return _ChewieDemoState();
// //   }
// // }

// class TrailerPlay extends StatelessWidget {
//   static const routeName = '/trailersMovie';
// //   TargetPlatform _platform;
// //   VideoPlayerController _videoPlayerController1;
// //   ChewieController _chewieController;

// //   @override
// //   void dispose() {
// //     _videoPlayerController1.dispose();
// //     _chewieController.dispose();
// //     super.dispose();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context).settings.arguments as Map<String, String>;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           routeArgs['title'],
//           style: TextStyle(color: Colors.green),
//         ),
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
//             onPressed: () => Navigator.of(context).pop()),
//         backgroundColor: Color(0xff4f4f4),
//         elevation: 0,
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(5),
//             child: Chewie(
//               controller: ChewieController(
//                 videoPlayerController: VideoPlayerController.network(
//                     'https://fvs.io/redirector?token=VzVQNW13R3l2VUZwYkFXL1pESGVuRHpNRFdXejRCMGp4RUZ6NmRWc2JIK0pvaERZenVUNmhDaFdEWDZhMCtuTGRaRzdHNnJWZHowQTU0QW5yL1pxd0MzVm1YZXRhOFRJbXpUK2VVM3NxTU9xTmtFazBnTVZ2U2E1ODhZSWxJL2djejNrRThNT0NjK3MweHRqb29wOTU3UU1HaDNhd0xiRHpSMjJDZz09OlF6YlNMYTcyNE5ka2wzZ2FubllyTnc9PQ'),
//                 aspectRatio: 4 / 2,
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: (BorderRadius.circular(5)),
//                           border: Border.all(color: Colors.white, width: 2),
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(routeArgs['imageUrl']))),
//                     ),
//                     Container(
//                       height: 20,
//                       width: 20,
//                     ),
//                     Text(
//                       routeArgs['title'],
//                       style: TextStyle(fontSize: 16, color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 ButtonTheme(
//                   minWidth: 10,
//                   buttonColor: Colors.white,
//                   child: RaisedButton(
//                     elevation: 0,
//                     onPressed: () {},
//                     child: Icon(
//                       Icons.favorite_border,
//                       color: Colors.red,
//                       size: 30,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Divider(color: Colors.black),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text("Có thể bạn thích",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     )),
//               ],
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: <Widget>[
//                   Recommend(),
//                   Recommend(),
//                   Recommend(),
//                   Recommend()
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
