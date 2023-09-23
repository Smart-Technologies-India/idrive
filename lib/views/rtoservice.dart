import 'package:carpage/service/service.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/rtostate.dart';

class RtoSection extends HookConsumerWidget {
  final int selectIndex;
  const RtoSection({Key? key, required this.selectIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rtoServiceW = ref.watch(rtoServiceState);
    //function and variables
    final isSubmit = useState(false);
    Color themcol = const Color(0xff8B5CF6);
    ValueNotifier<String?> rtoServiceName = useState(null);
    ValueNotifier rtoServiceList = useState([]);

    ValueNotifier<String?> titSerName = useState(null);
    ValueNotifier titSerList = useState([]);

    // ValueNotifier<String?> subSerName = useState(null);
    // ValueNotifier subSerList = useState([]);

    ValueNotifier<int?> subSerId = useState(null);
    ValueNotifier<int?> docServiceId = useState(null);

    ValueNotifier docData = useState([]);

    TextEditingController name = useTextEditingController();
    TextEditingController number = useTextEditingController();

    // ValueNotifier<List> resdata = useState<List>([
    //   {
    //     "price": "2000",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    //   {
    //     "price": "2300",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    //   {
    //     "price": "2500",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    //   {
    //     "price": "2600",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    //   {
    //     "price": "2800",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    //   {
    //     "price": "2100",
    //     "name": "New DL ,MCWOOG",
    //     "description": "New Driving License, DL - Driving License",
    //     "value": false
    //   },
    // ]);

    // ValueNotifier<List> resdataVal =
    //     useState<List>([false, false, false, false, false, false]);

    //find rto service
    Future<dynamic> getRtoService() async {
      try {
        return await ApiHandler().post(
          {
            'f': 'findRTO',
          },
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    initRtoService() async {
      dynamic rotRes = await getRtoService();
      if (rotRes["status"] == true) {
        for (int i = 0; i < rotRes["data"].length; i++) {
          rtoServiceList.value = [
            ...rtoServiceList.value,
            {
              "id": rotRes["data"][i]["Id"],
              "name": rotRes["data"][i]["rtoName"],
              "code": rotRes["data"][i]["rtoCode"]
            }
          ];
        }
      } else {
        Fluttertoast.showToast(
          msg: ('Unable to fetch rto service'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    // findServiceCategory
    Future<dynamic> getTitleService() async {
      try {
        return await ApiHandler().post(
          {
            'f': 'findServiceCategory',
          },
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    initTitleService() async {
      dynamic titleRes = await getTitleService();
      if (titleRes["status"] == true) {
        for (int i = 0; i < titleRes["data"].length; i++) {
          titSerList.value = [
            ...titSerList.value,
            {
              "id": titleRes["data"][i]["Id"],
              "name": titleRes["data"][i]["name"],
            }
          ];
        }
      } else {
        Fluttertoast.showToast(
          msg: ('Unable to fetch Data'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    Future<dynamic> getSubService(int id) async {
      try {
        return await ApiHandler().post(
          {'f': 'getServices', 'categoryId': '$id'},
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    // void initSubList() async {
    //   subSerList.value = [];
    //   dynamic httpRes = await getSubService(subSerId.value!);

    //   if (httpRes["status"] == true) {
    //     for (int i = 0; i < httpRes["data"][0]["serviceList"].length; i++) {
    //       subSerList.value = [
    //         ...subSerList.value,
    //         {
    //           "name": httpRes["data"][0]["serviceList"][i]["name"].toString(),
    //           "id": httpRes["data"][0]["serviceList"][i]["id"].toString()
    //         }
    //       ];
    //     }
    //   } else {
    //     Fluttertoast.showToast(
    //       msg: ('No Data Found in this services'),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0,
    //     );
    //   }
    // }

    Future<dynamic> getSerciveDoc(int id) async {
      try {
        return await ApiHandler().post(
          {'f': 'getDocsByService', 'serviceId': '$id'},
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    initshowDoc(int id) async {
      isSubmit.value = false;
      docData.value = [];

      dynamic docRes = await getSerciveDoc(id);

      if (docRes["status"] == true) {
        docData.value = docRes["data"];
        isSubmit.value = true;
      } else {
        Fluttertoast.showToast(
          msg: ('NO doc found'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    initdata() async {
      await initTitleService();
      await initRtoService();
      if (selectIndex != 6) {
        if (selectIndex == 0) {
          titSerName.value = "New Driving License";
          subSerId.value = 3;
        }
        if (selectIndex == 1) {
          titSerName.value = "Two Wheeler RTO Service";
          subSerId.value = 4;
        }
        if (selectIndex == 2) {
          titSerName.value = "Four Wheeler RTO Service";
          subSerId.value = 5;
        }
        if (selectIndex == 3) {
          titSerName.value = "I Hold Driving License";
          subSerId.value = 7;
        }
        if (selectIndex == 4) {
          titSerName.value = "4 Wheeler Private Imported";
          subSerId.value = 8;
        }
        if (selectIndex == 5) {
          titSerName.value = "2 Wheeler Imported";
          subSerId.value = 6;
        }
        // initSubList();
      }
    }

    useEffect(() {
      initdata();
      number.text = "9898989898";
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text(
          "Rto Services",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ]),
              padding: const EdgeInsets.only(
                  bottom: 20, left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 10),
                    child: Text(
                      "Fill all Data",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  if (selectIndex != 6) ...[
                    Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: (titSerName.value == null)
                          ? Center(
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: themcol,
                                ),
                              ),
                            )
                          : Text(
                              titSerName.value.toString(),
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                    ),
                  ],
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Select Rto Services"),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: const Text(
                          "select rto services",
                          textScaleFactor: 1,
                          style: TextStyle(fontSize: 15),
                        ),
                        // buttonDecoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //         color: Colors.black.withOpacity(0.15),
                        //         blurRadius: 8)
                        //   ],
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: Colors.white,
                        // ),
                        // itemPadding: const EdgeInsets.only(left: 5, right: 5),
                        // buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        value: rtoServiceName.value,
                        // icon: const Icon(
                        //   Icons.keyboard_arrow_down,
                        //   color: Colors.black,
                        //   size: 20,
                        // ),
                        items: [
                          for (int i = 0;
                              i < rtoServiceList.value.length;
                              i++) ...[
                            DropdownMenuItem(
                                value:
                                    rtoServiceList.value[i]["name"].toString(),
                                child: Text(
                                  "${rtoServiceList.value[i]["name"]} - [${rtoServiceList.value[i]["code"]}]",
                                  textScaleFactor: 1,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))
                          ]
                        ],
                        onChanged: (newValue) {
                          String myserviceid = "";
                          for (int i = 0;
                              i < rtoServiceList.value.length;
                              i++) {
                            if (rtoServiceList.value[i]["name"] == newValue) {
                              myserviceid =
                                  rtoServiceList.value[i]["id"]!.toString();
                            }
                          }
                          rtoServiceName.value = newValue;
                          docServiceId.value = int.parse(myserviceid);
                        },
                        // buttonElevation: 2,
                        // itemHeight: 40,
                        // dropdownMaxHeight: 200,
                        // dropdownPadding: null,
                        isDense: false,
                        // dropdownElevation: 8,
                        // scrollbarRadius: const Radius.circular(40),
                        // scrollbarThickness: 6,
                        // scrollbarAlwaysShow: true,
                        // offset: const Offset(0, -10),
                        // dropdownDecoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                      ),
                    ),
                  ),
                  if (selectIndex == 6) ...[
                    Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: const Text("Select Type of Service"),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          hint: const Text(
                            "select services",
                            textScaleFactor: 1,
                            style: TextStyle(fontSize: 15),
                          ),
                          // buttonDecoration: BoxDecoration(
                          //   boxShadow: [
                          //     BoxShadow(
                          //         color: Colors.black.withOpacity(0.15),
                          //         blurRadius: 8)
                          //   ],
                          //   borderRadius: BorderRadius.circular(10),
                          //   color: Colors.white,
                          // ),
                          // itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          // buttonPadding:
                          //     const EdgeInsets.only(left: 5, right: 5),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          value: titSerName.value,
                          // icon: const Icon(
                          //   Icons.keyboard_arrow_down,
                          //   color: Colors.black,
                          //   size: 20,
                          // ),
                          items: [
                            for (int i = 0;
                                i < titSerList.value.length;
                                i++) ...[
                              DropdownMenuItem(
                                  value: titSerList.value[i]["name"],
                                  child: Text(
                                    titSerList.value[i]["name"],
                                    textScaleFactor: 1,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))
                            ]
                          ],
                          onChanged: (newValue) {
                            titSerName.value = newValue;

                            String myserviceid = "";
                            for (int i = 0; i < titSerList.value.length; i++) {
                              if (titSerList.value[i]["name"] == newValue) {
                                myserviceid = titSerList.value[i]["id"]!;
                              }
                            }
                            subSerId.value = int.parse(myserviceid);
                            // initSubList();
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
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                        ),
                      ),
                    ),
                  ],
                  // Container(
                  //   padding:
                  //       const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                  //   child: const Text("Select Subtype of Services"),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton2<String>(
                  //       hint: const Text(
                  //         "select services subtype",
                  //         textScaleFactor: 1,
                  //         style: TextStyle(fontSize: 15),
                  //       ),
                  //       buttonDecoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.black.withOpacity(0.15),
                  //               blurRadius: 8)
                  //         ],
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white,
                  //       ),
                  //       itemPadding: const EdgeInsets.only(left: 5, right: 5),
                  //       buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                  //       style: const TextStyle(
                  //           fontSize: 18, fontWeight: FontWeight.w400),
                  //       value: subSerName.value,
                  //       icon: const Icon(
                  //         Icons.keyboard_arrow_down,
                  //         color: Colors.black,
                  //         size: 20,
                  //       ),
                  //       items: [
                  //         for (int i = 0; i < subSerList.value.length; i++) ...[
                  //           DropdownMenuItem(
                  //               value: subSerList.value[i]["name"],
                  //               child: Text(
                  //                 subSerList.value[i]["name"],
                  //                 textScaleFactor: 1,
                  //                 style: const TextStyle(
                  //                     color: Colors.black, fontSize: 15),
                  //               ))
                  //         ]
                  //       ],
                  //       onChanged: (newValue) {
                  //         String myserviceid = "";
                  //         for (int i = 0; i < subSerList.value.length; i++) {
                  //           if (subSerList.value[i]["name"] == newValue) {
                  //             myserviceid = subSerList.value[i]["id"]!;
                  //           }
                  //         }

                  //         subSerName.value = newValue;
                  //         docServiceId.value = int.parse(myserviceid);
                  //       },
                  //       buttonElevation: 2,
                  //       itemHeight: 40,
                  //       dropdownMaxHeight: 200,
                  //       dropdownPadding: null,
                  //       isDense: false,
                  //       dropdownElevation: 8,
                  //       scrollbarRadius: const Radius.circular(40),
                  //       scrollbarThickness: 6,
                  //       scrollbarAlwaysShow: true,
                  //       offset: const Offset(0, -10),
                  //       dropdownDecoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: themcol),
                        child: const Text("Proceed"),
                        onPressed: () async {
                          if (docServiceId.value == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Select the rto service.")));
                          } else {
                            await rtoServiceW.submit(
                                docServiceId.value!, subSerId.value!);
                            // await rtoServiceW.submit(5, 3);
                            await initshowDoc(docServiceId.value!);
                            isSubmit.value = true;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (isSubmit.value) ...[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "SELECT SERVICE?",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0;
                          i < rtoServiceW.agentData.length;
                          i++) ...[
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                "\u{20B9} ${double.parse(rtoServiceW.prices[i]).round()}",
                                textScaleFactor: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rtoServiceW.agentData[i]["title"],
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      rtoServiceW.agentData[i]["description"],
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                  value: rtoServiceW.selService[i],
                                  onChanged: (val) {
                                    rtoServiceW.changeService(val!, i);
                                  }),
                            ],
                          ),
                        ),
                      ],
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Base Fee ₹ :",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "₹${rtoServiceW.baseFees}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount (${rtoServiceW.discountPer}) % :",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "₹${rtoServiceW.discount.round()}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total :",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "₹${rtoServiceW.total}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: themcol),
                    child: const Text("Submit"),
                    onPressed: () async {},
                  ),
                ),
              ),
            ],
            if (5 < 1) ...[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 20, bottom: 10),
                        child: const Text("Your Name"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextField(
                            controller: name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xff8B5CF6),
                              ),
                              filled: true,
                              fillColor: Color(0xffE2E8F0),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter Your name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 20, bottom: 10),
                        child: const Text(
                          "Your Number",
                          textScaleFactor: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextField(
                            controller: number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xff8B5CF6),
                              ),
                              filled: true,
                              fillColor: Color(0xffE2E8F0),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter Your Number',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(
                          "1. Documents Required",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      for (int i = 0;
                          i < docData.value["docsReq"].length;
                          i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 0,
                            left: 25,
                          ),
                          child: RichText(
                              text: TextSpan(
                                  text:
                                      "${i + 1}. ${docData.value["docsReq"][i]["name"]}\n",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  children: [
                                for (int j = 0;
                                    j <
                                        docData
                                            .value["docsReq"][i]["docs"].length;
                                    j++) ...[
                                  TextSpan(
                                    text: (docData.value["docsReq"][i]["docs"]
                                                .length ==
                                            j + 1)
                                        ? "${docData.value["docsReq"][i]["docs"][j]["name"]}."
                                        : "${docData.value["docsReq"][i]["docs"][j]["name"]}/",
                                  )
                                ]
                              ])),
                        ),
                      ],
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(
                          "2. Fees",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 0,
                          left: 25,
                        ),
                        child: Text(
                          "a. Fees Starts from Rs.${docData.value["fees"].toString().split(".")[0]} on wards.",
                          textScaleFactor: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(
                          "3. Time Frame",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 0,
                          left: 25,
                        ),
                        child: Text(
                          "a. It's takes  ${docData.value["minDay"]}-${docData.value["maxDay"]} days.",
                          textScaleFactor: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ]),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
