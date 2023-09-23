import 'package:carpage/views/userservices/tools/holidaysList.dart';
import 'package:carpage/views/userservices/tools/roadsigns.dart';
import 'package:carpage/views/userservices/tools/rodasafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolsPage extends HookWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff22c55e),
        title: const Text("Tools"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assest/images/learn_swift.png",
              width: width,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HolidaysList(),
                  ),
                );
              },
              child: colItem(
                const Color(0xff06b6d4),
                "Holidays List",
                Icons.holiday_village,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const RoadSigns()),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const RoadSigns()),
                            ),
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const RoadSigns()),
                              ),
                            );
                          },
                          child: rowItem(Icons.import_contacts,
                              "MANDATORY SIGNS", const Color(0xfff39c12)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: rowItem(Icons.warning_amber, "CAUTIONARY SIGNS",
                        const Color(0xff3498db)),
                  ),
                  Expanded(
                    child: rowItem(Icons.info_outline, "INFORMATORY SIGNS",
                        const Color(0xff9b59b6)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadSafety(),
                  ),
                );
              },
              child: colItem(
                const Color(0xff1abc9c),
                "Road Safety Book",
                Icons.health_and_safety,
              ),
            ),
            textItem(width, "Emergency Helpline Number"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse("tel:100"));
                      },
                      child: rowItem(
                        Icons.local_police,
                        "100\nPolice",
                        const Color(0xff8e44ad),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse("tel:101"));
                      },
                      child: rowItem(
                        Icons.fire_truck_outlined,
                        "101\nFire",
                        const Color(0xff27ae60),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(
                          Uri.parse("tel:108"),
                        );
                      },
                      child: rowItem(
                        Icons.health_and_safety,
                        "108\nAmbulance",
                        const Color(0xfff39c12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            textItem(width, "Transport Servies"),
            GestureDetector(
              onTap: () {
                launchUrl(
                  Uri.parse("https://www.parivahan.gov.in"),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe67e22),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.wifi_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Website : www.parivahan.gov.in",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: rowItem(
                      Icons.format_align_left_sharp,
                      "REGISTRATION OF VEHICLE",
                      const Color(0xffe74c3c),
                    ),
                  ),
                  Expanded(
                    child: rowItem(
                      Icons.format_align_center_outlined,
                      "RENEWAL OF\nNEW  RC",
                      const Color(0xff34495e),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: rowItem(
                      Icons.attach_money_rounded,
                      "OWNERSHIP\nTRANSFER",
                      const Color(0xff1abc9c),
                    ),
                  ),
                  Expanded(
                    child: rowItem(
                      Icons.book,
                      "LEARNER'S\nLICENSE",
                      const Color(0xff2ecc71),
                    ),
                  ),
                  Expanded(
                    child: rowItem(
                      Icons.settings_accessibility_outlined,
                      "NO OBJECTIO\nCERTIFICAE",
                      const Color(0xff3498db),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: rowItem(
                      Icons.door_front_door_rounded,
                      "HP\nTERMINATION",
                      const Color(0xff9b59b6),
                    ),
                  ),
                  Expanded(
                    child: rowItem(
                      Icons.fire_truck,
                      "MOTOR VEHICLE ACT",
                      const Color(0xffe67e22),
                    ),
                  ),
                  Expanded(
                    child: rowItem(
                      Icons.hotel_class_sharp,
                      "PERMANENT\nLICENSE",
                      const Color(0xffe74c3c),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget rowItem(IconData icon, String title, Color col) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: col,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget colItem(Color col, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: col,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 45,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            textScaleFactor: 1,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
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
            fontSize: 22,
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
