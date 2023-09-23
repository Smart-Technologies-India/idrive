import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideos extends HookWidget {
  final String title;
  final List ytVideo;
  const YoutubeVideos({
    Key? key,
    required this.title,
    required this.ytVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDD6FE),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          for (int i = 0; i < ytVideo.length; i++) ...[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => YTPlayer(
                              title: ytVideo[i]["title"],
                              link: ytVideo[i]["link"],
                            ))));
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Color(0xff8B5CF6), offset: Offset(-3, 0)),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                        imageUrl: ytVideo[i]["url"],
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                          "assest/images/learn_city.png",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, right: 5, bottom: 5, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ytVideo[i]["title"],
                            textScaleFactor: 1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ytVideo[i]["subtitle"],
                            textScaleFactor: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ]
        ]),
      )),
    );
  }
}

class YTPlayer extends HookWidget {
  final String title;
  final String link;
  const YTPlayer({
    Key? key,
    required this.title,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      // initialVideoId: 'iLnmTe5Q2Qw',
      initialVideoId: link,
      flags: const YoutubePlayerFlags(autoPlay: true, startAt: 0),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xff8B5CF6),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
