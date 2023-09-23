import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RoadSigns extends HookWidget {
  const RoadSigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List gaz = [
      {
        "title":
            "This sign show that the drivers should stop right there at their place.",
        "name": "Stop",
      },
      {
        "title":
            "This sign is sued to indicate direction to the traffic to give way to right side drivers.",
        "name": "Give Side"
      },
      {
        "title":
            "This sign indicates clearly that there is a restricted area ahed, so the driver should not go ahead",
        "name": "Stop There",
      },
    ];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3498db),
        centerTitle: true,
        title: const Text("HOLIDAYS LIST"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(
                    0xff2ecc71,
                  ),
                ),
                child: const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 75,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "HOLIDAYS LIST",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              textItem(width, "ROAD SIGNS"),
              for (int i = 0; i < gaz.length; i++) ...[
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          "assest/images/learn_swift.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gaz[i]["title"],
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.95),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              gaz[i]["name"],
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(double width, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: Center(
        child: Text(
          title,
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
