import 'package:carpage/views/userservices/ytvideos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainAndFirstAid extends HookWidget {
  const MainAndFirstAid({super.key});

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(initialLength: 2);
    List maintencanceYt = [
      {
        "title": "Car maintenance Tips - Hindi",
        "subtitle": "Hindi",
        "link": "5ZV_88_C9Rc",
        "url": "https://i.ytimg.com/vi/5ZV_88_C9Rc/maxresdefault.jpg"
      },
      {
        "title": "BASIC MAINTENANCE TIPS OF CAR - Marathi",
        "subtitle": "Marathi",
        "link": "KRfsjElmhKI",
        "url": "https://i1.ytimg.com/vi/KRfsjElmhKI/hqdefault.jpg"
      },
      {
        "title": "10 Things Every Car Owner Should Know",
        "subtitle": "English",
        "link": "BjX79GsALd8",
        "url": "https://i.ytimg.com/vi_webp/BjX79GsALd8/maxresdefault.webp"
      },
      {
        "title": "Car Routine Checkups",
        "subtitle": "Hindi",
        "link": "ES2VdjzJoDU",
        "url": "https://i.ytimg.com/vi_webp/ES2VdjzJoDU/maxresdefault.webp"
      },
      {
        "title": "Check Before Weekend Trips",
        "subtitle": "Hindi",
        "link": "Vb0RST541iI",
        "url": "https://i.ytimg.com/vi_webp/Vb0RST541iI/maxresdefault.webp"
      },
    ];

    List firstadYt = [
      {
        "title": "Basic First Aid Skills",
        "subtitle": "Hindi",
        "link": "DQ7JPNgU8Wg",
        "url": "https://i.ytimg.com/vi/DQ7JPNgU8Wg/maxresdefault.jpg?v=5fbd222e"
      },
      {
        "title": "First Aid in Choking",
        "subtitle": "English",
        "link": "tBp3mkX6JGo",
        "url": "https://i.ytimg.com/vi/tBp3mkX6JGo/maxresdefault.jpg"
      },
      {
        "title": "First Aid in Heart Attack",
        "subtitle": "English",
        "link": "WDh0LdqCeYg",
        "url": "https://i.ytimg.com/vi/WDh0LdqCeYg/maxresdefault.jpg"
      },
      {
        "title": "First Aid for Burns",
        "subtitle": "English",
        "link": "B51VgoEZcDs",
        "url": "https://i.ytimg.com/vi/B51VgoEZcDs/maxresdefault.jpg"
      },
      {
        "title": "First Aid for Broken Bones",
        "subtitle": "English",
        "link": "OVPhOFhb7_Y",
        "url": "https://i.ytimg.com/vi_webp/OVPhOFhb7_Y/maxresdefault.webp"
      },
      {
        "title": "First Aid for Nose Bleeding",
        "subtitle": "English",
        "link": "IlqmRoaZc",
        "url": "https://i.ytimg.com/vi/S-IlqmRoaZc/maxresdefault.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Section"),
        backgroundColor: const Color(0xff8B5CF6),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: const [
            Tab(
              text: "Menintenance training",
            ),
            Tab(
              text: "First aid",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            YoutubeVideos(
              title: "Maintenance Training",
              ytVideo: maintencanceYt,
            ),
            YoutubeVideos(
              title: "First Aid",
              ytVideo: firstadYt,
            ),
          ],
        ),
      ),
    );
  }
}
