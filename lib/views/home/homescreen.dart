import 'package:carousel_slider/carousel_slider.dart';
import 'package:carpage/utils.dart';
import 'package:carpage/views/LicSer/idp.dart';
import 'package:carpage/views/LicSer/newlic.dart';
import 'package:carpage/views/LicSer/renewlic.dart';
import 'package:carpage/views/refer_and_earn.dart';
import 'package:carpage/views/rtoservice.dart';
import 'package:carpage/views/userservices/lessionpage.dart';
import 'package:carpage/views/userservices/tools/tools.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

import '../../state/questionanswer/queansstate.dart';
import '../../state/util.dart';
import '../LicSer/applayforidp.dart';
import '../LicSer/changeofaddress.dart';
import '../LicSer/dlrenewal.dart';
import '../LicSer/drivinglicence.dart';
import '../LicSer/duplicatedl.dart';
import '../LicSer/learnerlience.dart';
import '../courseSelection/selectCourse.dart';
import '../gift.dart';
import '../userservices/mainfirstaid.dart';
import '../userservices/questionbank.dart';
import '../userservices/studymaterial.dart';
import 'drawer.dart';

void playSound() async {
  await PerfectVolumeControl.setVolume(0.5);

  final player = AudioPlayer();
  await player.setAsset("assest/audio/car_ignition.mp3");
  player.play();
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    List img = [
      "assest/images/learn_innova.png",
      "assest/images/learn_swift.png",
      "assest/images/learn_city.png",
    ];

    List selectC = [
      {
        "img": "assest/images/cat/beginner.jpg",
        "name": "Beginner",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/advanced.jpg",
        "name": "Advance",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/expert.jpg",
        "name": "Expert",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/refresh.jpg",
        "name": "Refresh",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/bike.png",
        "name": "Bike",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/auto.png",
        "name": "Auto",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/truck.png",
        "name": "Truck",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/scooter.jpg",
        "name": "Scooter",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
      {
        "img": "assest/images/cat/commercial.png",
        "name": "Commercial",
        "exp": "11 Hours",
        "con":
            "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
      },
    ];

    ValueNotifier<List> licenseService = useState([
      {
        "name": "Learner Licence",
        "img": "assest/images/services/LL4.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LearnerLicence(),
              ));
        },
      },
      {
        "name": "Driving Licence",
        "img": "assest/images/services/driving-icon.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DrivingLicence(),
              ));
        },
      },
      {
        "name": "DL Renewal",
        "img": "assest/images/services/renewal-icon.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DLRenewal(),
              ));
        },
      },
      {
        "name": "Duplicate DL",
        "img": "assest/images/services/NCL1.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuplicateDL(),
              ));
        },
      },
      {
        "name": "Change Address",
        "img": "assest/images/services/CA.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeOfAddress(),
              ));
        },
      },
      {
        "name": "apply for IDP",
        "img": "assest/images/services/IDP.png",
        "fun": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ApplyForIDP(),
              ));
        },
      },
    ]);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        title: const Text(
          "iDrive",
          textScaleFactor: 1,
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: const Color(0xff8B5CF6),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //slider
              Container(
                color: Colors.white,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(milliseconds: 3000),
                      height: 270.0,
                      enlargeCenterPage: true,
                      viewportFraction: 1),
                  items: img.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          child: Container(
                            width: width,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4), blurRadius: 4),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                        child: const Text(
                          "Select your course",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          runSpacing: 5,
                          spacing: 1,
                          children: [
                            for (int i = 0; i < selectC.length; i++) ...[
                              GestureDetector(
                                onTap: () {
                                  playSound();
                                  if (i == 0 || i == 1 || i == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectCourse(
                                          name: selectC[i]["name"],
                                          exp: selectC[i]["exp"],
                                          type: 1,
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectCourse(
                                          name: selectC[i]["name"],
                                          exp: selectC[i]["exp"],
                                          type: 2,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 95,
                                        height: 80,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            selectC[i]["img"],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              selectC[i]["name"],
                                              textScaleFactor: 1,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          //icon button
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Center(
                                                          child: Text(
                                                            "${selectC[i]["name"]} course",
                                                            textScaleFactor: 1,
                                                          ),
                                                        ),
                                                        actions: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xff8B5CF6)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "OK"),
                                                          )
                                                        ],
                                                        content: Text(
                                                          "\u{2022} ${selectC[i]["con"]}",
                                                          textScaleFactor: 1,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              margin: const EdgeInsets.all(5),
                                              child: const Icon(
                                                Icons.info_outline_rounded,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 20.0),
                      //   child: Text(
                      //     "Popular Courses",
                      //     textScaleFactor: 1,
                      //     style: TextStyle(
                      //         fontSize: 20, fontWeight: FontWeight.w600),
                      //   ),
                      // ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(children: [
                      //     listData(
                      //         "Swift in 15 days",
                      //         "Learn Swift in 15 days easy and better way",
                      //         "assest/images/learn_swift.png"),
                      //     listData(
                      //         "Honda City in 20 Days",
                      //         "Learn to Drive a sedan in 20 Days",
                      //         "assest/images/learn_city.png"),
                      //     listData(
                      //         "Innova in 25 Days",
                      //         "Become a pro driver with an SUV.",
                      //         "assest/images/learn_innova.png"),
                      //   ]),
                      // ),
                    ]),
              ),
              const SizedBox(
                height: 40,
              ),

              //Section two start from here
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4), blurRadius: 4),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "RTO Services",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        RtoService(
                          title: "New Driving \nLicense",
                          imgurl: "assest/images/lmv_india.png",
                          index: 0,
                        ),
                        RtoService(
                          title: "Two Wheeler RTO\nService",
                          imgurl: "assest/images/2_wheeler_indian.png",
                          index: 1,
                        ),
                        RtoService(
                          title: "Four Wheeler\nService",
                          imgurl: "assest/images/lmv_tourist_registration.png",
                          index: 2,
                        ),
                        RtoService(
                          title: "I Hold Driving\nLicense",
                          imgurl: "assest/images/lmv_imported.png",
                          index: 3,
                        ),
                        // RtoService(
                        //   title: "Heavy Vehicle\nRegistration",
                        //   imgurl:
                        //       "assest/images/heavy_vehicle_registration.png",
                        //   index: 3,
                        // ),
                        // const RtoService(
                        //   title: "Bike Registration\nImported",
                        //   imgurl: "assest/images/2_wheeler_imported.png",
                        //   index: 5,
                        // ),
                        // Container(
                        //   width: 60,
                        //   height: 190,
                        //   margin: const EdgeInsets.only(
                        //       left: 10, right: 10, top: 15, bottom: 15),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const RtoSection(
                        //             selectIndex: 6,
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     child: Center(
                        //         child: Container(
                        //       padding: const EdgeInsets.all(5),
                        //       decoration: BoxDecoration(boxShadow: [
                        //         BoxShadow(
                        //             color: Colors.black.withOpacity(0.25),
                        //             blurRadius: 10)
                        //       ], color: Colors.white, shape: BoxShape.circle),
                        //       child: const Icon(
                        //         Icons.arrow_forward,
                        //         size: 30,
                        //       ),
                        //     )),
                        //   ),
                        // ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Licence Services",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              spacing: 4,
                              runSpacing: 5,
                              children: [
                                for (int i = 0;
                                    i < licenseService.value.length;
                                    i++) ...[
                                  GestureDetector(
                                    onTap: () {
                                      licenseService.value[i]["fun"]();
                                    },
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              licenseService.value[i]["img"]),
                                          Text(
                                            licenseService.value[i]["name"],
                                            textScaleFactor: 1,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const LicSer(),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              //section three start from here
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4), blurRadius: 4),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CarsSection(
                      name: selectC[0]["name"],
                      con: selectC[0]["con"],
                    ),
                    const SizedBox(height: 10),
                    const GiftFriend(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Why choose iDrive",
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  listImg("assest/images/drivingschool_banner.jpg"),
                  listImg("assest/images/rtoservice_banner.jpg"),
                  listImg("assest/images/4wheelertraining_banner.jpg")
                ]),
              ),
              const ReferEarn(),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "User Services",
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  //youtube Videos
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => YoutubeVideos(
                  //           title: "Maintenance Training",
                  //           ytVideo: maintencanceYt,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: listImg("assest/images/maintenance_training.png"),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => YoutubeVideos(
                  //           title: "First Aid",
                  //           ytVideo: firstadYt,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: listImg("assest/images/first_aid.png"),
                  // ),

                  //pdf files
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: ((context) => MyPdfViwer(
                  //               title: "Study Material",
                  //               pdfData: studyMaterial,
                  //             )),
                  //       ),
                  //     );
                  //   },
                  //   child: listImg("assest/images/study_material.png"),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: ((context) => MyPdfViwer(
                  //               title: "Rules and Regulation",
                  //               pdfData: rulesAndCharges,
                  //             )),
                  //       ),
                  //     );
                  //   },
                  //   child: listImg("assest/images/rules.png"),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: ((context) => MyPdfViwer(
                  //               title: "Penalties and Charges",
                  //               pdfData: rulesAndCharges,
                  //             )),
                  //       ),
                  //     );
                  //   },
                  //   child: listImg("assest/images/penalties.png"),
                  // ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuestionBank(),
                        ),
                      );
                    },
                    child: listImg("assest/images/practice_questions.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LessionPage()));
                    },
                    child: listImg("assest/images/practice_test.png"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            title: "Mock Test",
                            range: 15,
                            sequence: 1,
                            start: randomNumberMinMax(
                                0, ref.watch(queAnsState).question.length - 15),
                          ),
                        ),
                      );
                    },
                    child: listImg("assest/images/moke_test.png"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const ToolsPage()),
                        ),
                      );
                    },
                    child: listImg("assest/images/tools.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainAndFirstAid(),
                        ),
                      );
                    },
                    child: listImg("assest/images/maintenance_training.png"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const StadyMaterial()),
                        ),
                      );
                    },
                    child: listImg("assest/images/study_material.png"),
                  ),
                ]),
              ),
              const Footer(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listImg(String url) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3))
      ]),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Image.asset(
              url,
              fit: BoxFit.cover,
              width: 320,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget listData(String title, String sub, String imgUrl) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sub,
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.55)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "EXPLORE NOW!",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8B5CF6)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RtoService extends HookWidget {
  final String? title;
  final String? imgurl;
  final int? index;
  const RtoService(
      {Key? key,
      required this.title,
      required this.imgurl,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RtoSection(
              selectIndex: index!,
            ),
          ),
        );
      },
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imgurl!,
                height: 130,
                width: 155,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title!,
                textScaleFactor: 1,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RtoSection(
                        selectIndex: index!,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "EXPLORE NOW!",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8B5CF6)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StyMat extends HookWidget {
  const StyMat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List styma = [
      "Study Material",
      "Mock Test",
      "Maintenance Training",
      "Tools"
    ];

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Study Test",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < styma.length; i++) ...[
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xffe5E7EB),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          styma[i],
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.65),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarsSection extends HookConsumerWidget {
  final String name;
  final String con;
  const CarsSection({Key? key, required this.name, required this.con})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilStateW = ref.watch(utilState);
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Check our wide range of cars!",
              textScaleFactor: 1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8B5CF6)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "We've got you cars for every need with best deals.",
              textScaleFactor: 1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 2,
              runSpacing: 5,
              children: [
                for (var i = 0; i < utilStateW.carData.length; i++) ...[
                  SizedBox(
                    width: 90,
                    height: 100,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            utilStateW.carData[i]["imgUrl"],
                            width: 80,
                            height: 60,
                          ),
                          Text(
                            "${utilStateW.carData[i]["carName"]}",
                            textScaleFactor: 1,
                          ),
                          Text(
                            "${utilStateW.carData[i]["price"]}",
                            textScaleFactor: 1,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8B5CF6),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(0)),
              onPressed: () async {
                playSound();
              },
              child: const Text("BOOK NOW"),
            ),
          ),
        ],
      ),
    );
  }
}

class GiftFriend extends HookConsumerWidget {
  const GiftFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(10),
        // color: const Color(0xffF472B6),
        gradient: const LinearGradient(
          colors: [
            Color(0xffffffff),
            Color(0xffC4B5FD),
            Color(0xffA78BFA),
            Color(0xff8B5CF6),
          ],
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assest/images/gift.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gift your\nloved one",
                    textAlign: TextAlign.left,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GiftPage()));
                      },
                      child: const Text(
                        "Know More",
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LicSer extends HookConsumerWidget {
  const LicSer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilStateW = ref.watch(utilState);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(10),
        // color: const Color(0xff8B5CF6),
        gradient: const LinearGradient(
          colors: [
            Color(0xffC4B5FD),
            Color(0xffA78BFA),
            Color(0xff8B5CF6),
          ],
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Licence Services",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      hint: const Text(
                        "select services",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                      // buttonDecoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: Colors.white,
                      // ),
                      // itemPadding: const EdgeInsets.only(left: 5, right: 5),
                      // buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      value: utilStateW.dropDownValue,
                      // icon: const Icon(
                      //   Icons.keyboard_arrow_down,
                      //   color: Colors.black,
                      //   size: 20,
                      // ),
                      items: utilStateW.dropDown.map((String item) {
                        return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        utilStateW.setDropDownVal(newValue.toString());
                      },
                      // buttonElevation: 2,
                      // itemHeight: 40,
                      // dropdownMaxHeight: 200,
                      // dropdownPadding: null,
                      // isDense: false,
                      // dropdownElevation: 8,
                      // scrollbarRadius: const Radius.circular(40),
                      // scrollbarThickness: 6,
                      // scrollbarAlwaysShow: true,
                      // offset: const Offset(0, -10),
                      // dropdownDecoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(5),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      onPressed: () async {
                        switch (utilStateW.dropDownValue) {
                          case "New Licence":
                            playSound();
                            Vibrate.vibrate();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewLic(),
                              ),
                            );
                            break;
                          case "Renew Licence":
                            playSound();
                            Vibrate.vibrate();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RenewLic(),
                              ),
                            );
                            break;
                          case "IDP Service":
                            playSound();
                            Vibrate.vibrate();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IdpForm(),
                              ),
                            );
                            break;

                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please select any one options atlist"),
                              ),
                            );
                        }
                      },
                      child: const Text(
                        "Know More",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10),
              ),
              child: SizedBox(
                height: 160,
                child: Image.asset(
                  "assest/images/carbg.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReferEarn extends HookWidget {
  const ReferEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 10)
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "REFER AND EARN",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Refer your friend and earn upto Rs.500",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.55)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReferAndEarn()));
                    },
                    child: const Text(
                      "REFER FRIENDS",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8B5CF6)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset("assest/images/car5.png"),
          ),
        ],
      ),
    );
  }
}

class Footer extends HookWidget {
  const Footer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 2.5))),
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          "Never\nStop\nLiving.",
          textScaleFactor: 1,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
