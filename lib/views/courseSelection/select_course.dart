import 'package:carpage/views/courseSelection/step2.dart';
import 'package:carpage/views/courseSelection/step4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectCourse extends HookConsumerWidget {
  final int type;
  final String name;
  final String exp;
  const SelectCourse({
    Key? key,
    required this.name,
    required this.exp,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color themcol = const Color(0xff8B5CF6);
    List cartypes = ["Hatch back", "Sedan", "SUV"];
    List chiad = ["30", "60"];
    List ctimerange = [
      "7AM-9AM",
      "9AM-11AM",
      "11AM-2PM",
      "2PM-5PM",
      "5PM-7PM",
      "7PM-9PM",
    ];

    final initCType = useState(0);
    final iniTTime = useState(0);
    final inittimerange = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Course"),
        backgroundColor: themcol,
        // actions: [
        //   Center(
        //       child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       (type == 1) ? "Step 1/4" : "Step 1/2",
        //       textScaleFactor: 1,
        //       style: const TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.white),
        //     ),
        //   ))
        // ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //top image
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assest/images/carbg.png",
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: [
                    const Text(
                      "Selected Course",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.edit, color: themcol),
                      label: Text(
                        "Change",
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: themcol,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff8B5CF6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        name,
                        textScaleFactor: 1,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        exp,
                        textScaleFactor: 1,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              if (type == 1) ...[
                //selecte vihicle
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    "Select Type of Vehicle",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(children: [
                    for (var i = 0; i < cartypes.length; i++) ...[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            initCType.value = i;
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 4, right: 4),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (initCType.value == i)
                                        ? const Color(0xff8B5CF6)
                                        : const Color(0xff94A3B8),
                                    width: 1.5),
                                color: (initCType.value == i)
                                    ? const Color(0xffDDD6FE)
                                    : const Color(0xffF1F5F9),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              cartypes[i],
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (initCType.value == i)
                                      ? const Color(0xff8B5CF6)
                                      : Colors.black),
                            ),
                          ),
                        ),
                      )
                    ]
                  ]),
                ),
              ],

              //selete min/day
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "No of Mins/Day",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(children: [
                  for (var i = 0; i < chiad.length; i++) ...[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          iniTTime.value = i;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 4, right: 4),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: (iniTTime.value == i)
                                      ? const Color(0xff8B5CF6)
                                      : const Color(0xff94A3B8),
                                  width: 1.5),
                              color: (iniTTime.value == i)
                                  ? const Color(0xffDDD6FE)
                                  : const Color(0xffF1F5F9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            chiad[i],
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (iniTTime.value == i)
                                    ? const Color(0xff8B5CF6)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    )
                  ]
                ]),
              ),
              //selete time range
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "Preferable time slot",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(spacing: 10, runSpacing: 8, children: [
                for (var i = 0; i < ctimerange.length; i++) ...[
                  InkWell(
                    onTap: () {
                      inittimerange.value = i;
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 50) / 3,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: (inittimerange.value == i)
                                  ? const Color(0xff8B5CF6)
                                  : const Color(0xff94A3B8),
                              width: 1.5),
                          color: (inittimerange.value == i)
                              ? const Color(0xffDDD6FE)
                              : const Color(0xffF1F5F9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        ctimerange[i],
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: (inittimerange.value == i)
                                ? const Color(0xff8B5CF6)
                                : Colors.black),
                      ),
                    ),
                  )
                ]
              ]),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8B5CF6),
                  ),
                  onPressed: () {
                    if (type == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step2(
                              course: name.toLowerCase(),
                              vehicle: cartypes[initCType.value]
                                  .toString()
                                  .toLowerCase(),
                              nofoninday: iniTTime.value.toString(),
                              timerange: inittimerange.value.toString()),
                        ),
                      );
                    } else {
                      if (name.toString().toLowerCase() == "bike") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step4(
                              id: "1",
                              type: iniTTime.value.toString(),
                              slot: inittimerange.value.toString(),
                              course: "5",
                              agentId: "1",
                            ),
                          ),
                        );
                      } else if (name.toString().toLowerCase() == "truck") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step4(
                              id: "1",
                              type: iniTTime.value.toString(),
                              slot: inittimerange.value.toString(),
                              course: "8",
                              agentId: "1",
                            ),
                          ),
                        );
                      } else if (name.toString().toLowerCase() == "auto") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step4(
                              id: "1",
                              type: iniTTime.value.toString(),
                              slot: inittimerange.value.toString(),
                              course: "6",
                              agentId: "1",
                            ),
                          ),
                        );
                      } else if (name.toString().toLowerCase() ==
                          "commercial") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step4(
                              id: "1",
                              type: iniTTime.value.toString(),
                              slot: inittimerange.value.toString(),
                              course: "7",
                              agentId: "1",
                            ),
                          ),
                        );
                      } else if (name.toString().toLowerCase() == "refresh") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step4(
                              id: "1",
                              type: iniTTime.value.toString(),
                              slot: inittimerange.value.toString(),
                              course: "4",
                              agentId: "1",
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Choose vehicle",
                    textScaleFactor: 1,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
