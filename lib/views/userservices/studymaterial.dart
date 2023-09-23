import 'package:carpage/views/userservices/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StadyMaterial extends HookWidget {
  const StadyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(initialLength: 3);
    List studyMaterial = [
      {
        "title": "LL Test",
        "subtitle": "English",
        "link":
            "http://www.idriveindia.com/app/uploads/docs/LL_test_english.pdf"
      },
      {
        "title": "LL Test",
        "subtitle": "Hindi",
        "link": "http://www.idriveindia.com/app/uploads/docs/LL_test_hindi.pdf"
      },
      {
        "title": "LL Test",
        "subtitle": "Marathi",
        "link":
            "http://www.idriveindia.com/app/uploads/docs/LL_test_marathi.pdf"
      },
    ];

    List rulesAndCharges = [
      {
        "title": "Motor Vehicle Act",
        "subtitle": "Hindi",
        "link":
            "http://www.idriveindia.com/app/uploads/docs/motor_vehicle_act.pdf"
      },
      {
        "title": "Offences Penalties and Procedure",
        "subtitle": "English",
        "link":
            "http://www.idriveindia.com/app/uploads/docs/OFFENCES_PENALTIES_AND_PROCEDURE.pdf"
      },
      {
        "title": "Traffic Penalty Maharashra",
        "subtitle": "English",
        "link":
            "http://www.idriveindia.com/app/uploads/docs/traffic_penalty_maharashtra.pdf"
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
          isScrollable: true,
          tabs: const [
            Tab(
              text: "Study Material",
            ),
            Tab(
              text: "Rules and Regulation",
            ),
            Tab(
              text: "Penalties and Charges",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            MyPdfViwer(
              title: "Study Material",
              pdfData: studyMaterial,
            ),
            MyPdfViwer(
              title: "Rules and Regulation",
              pdfData: rulesAndCharges,
            ),
            MyPdfViwer(
              title: "Penalties and Charges",
              pdfData: rulesAndCharges,
            ),
          ],
        ),
      ),
    );
  }
}
