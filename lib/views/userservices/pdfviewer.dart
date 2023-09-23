import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPdfViwer extends HookWidget {
  final String title;
  final List pdfData;
  const MyPdfViwer({
    Key? key,
    required this.title,
    required this.pdfData,
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
          for (int i = 0; i < pdfData.length; i++) ...[
            GestureDetector(
              onTap: () {
                //next page data will be here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPdf(
                      link: pdfData[i]["link"],
                      title: pdfData[i]["title"],
                    ),
                  ),
                );
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
                      child: Image.asset(
                        "assest/images/learn_city.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
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
                            pdfData[i]["title"],
                            textScaleFactor: 1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            pdfData[i]["subtitle"],
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

class MyPdf extends StatefulWidget {
  final String link;
  final String title;
  const MyPdf({Key? key, required this.link, required this.title})
      : super(key: key);

  @override
  State<MyPdf> createState() => _MyPdfState();
}

class _MyPdfState extends State<MyPdf> {
  PdfViewerController controller = PdfViewerController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: (isLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : SfPdfViewer.network(
                          controller: controller,
                          widget.link,
                          pageLayoutMode: PdfPageLayoutMode.single,
                        ),
                ),
              ),
              if (!isLoading) ...[
                Positioned(
                  left: 0,
                  bottom: height * 0.025,
                  child: SizedBox(
                    width: width,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff8B5CF6)),
                              onPressed: () {
                                controller.previousPage();
                              },
                              child: const Text("Previous")),
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff8B5CF6)),
                                onPressed: () {
                                  controller.nextPage();
                                },
                                child: const Text("Next")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color(0xff8B5CF6),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 5)
                        ]),
                    width: width,
                    child: Row(children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Text(
                        widget.title,
                        textScaleFactor: 1,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
