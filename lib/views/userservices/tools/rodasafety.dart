import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RoadSafety extends HookWidget {
  const RoadSafety({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List books = [
      "Road Safety Book",
      "Mandatory Signs",
      "Gautionary Signs",
      "Informatory Signs",
    ];
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff06b6d4),
        centerTitle: true,
        title: const Text("Road Safety Books"),
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
                        Icons.add_road,
                        color: Colors.white,
                        size: 75,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Road Safety",
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
              textItem(width, "Downloads Books"),
              for (int i = 0; i < books.length; i++) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color(0xff06b6d4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.picture_as_pdf,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        books[i],
                        textScaleFactor: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: width,
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                //   margin:
                //       const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.blue,
                //       width: 1,
                //     ),
                //   ),
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(5),
                //         child: Image.asset(
                //           "assest/images/learn_swift.png",
                //           width: 80,
                //           height: 80,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       Expanded(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               gaz[i]["title"],
                //               textScaleFactor: 1,
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black.withOpacity(0.95),
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 3,
                //             ),
                //             Text(
                //               gaz[i]["name"],
                //               textScaleFactor: 1,
                //               style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black.withOpacity(0.85),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
