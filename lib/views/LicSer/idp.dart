import 'package:carpage/service/service.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class IdpForm extends HookWidget {
  const IdpForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController name = useTextEditingController();
    TextEditingController licNo = useTextEditingController();
    TextEditingController doe = useTextEditingController();
    Color themcol = const Color(0xff8B5CF6);

    ValueNotifier docData = useState([]);
    final isSubmit = useState(false);

    final ValueNotifier<String?> stossub = useState(null);
    final serviceList = useState([]);

    int serviceId = 3;
    ValueNotifier<int?> docServiceId = useState(null);

    Future<dynamic> getServiceTypeWiseServiceList() async {
      try {
        return await ApiHandler().post(
          {'f': 'getServices', 'categoryId': '$serviceId'},
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    void initList() async {
      serviceList.value = [];
      dynamic httpRes = await getServiceTypeWiseServiceList();

      if (httpRes["status"] == true) {
        for (int i = 0; i < httpRes["data"][0]["serviceList"].length; i++) {
          serviceList.value = [
            ...serviceList.value,
            {
              "name": httpRes["data"][0]["serviceList"][i]["name"].toString(),
              "id": httpRes["data"][0]["serviceList"][i]["id"].toString()
            }
          ];
        }
      } else {
        Fluttertoast.showToast(
          msg: ('No Data Found in this services'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

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
        isSubmit.value = false;
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

    useEffect(() {
      initList();
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text("IDP Services"),
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
                      "Fill The Details",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),

                  //user name
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Name of Recipient"),
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
                            decoration: TextDecoration.none),
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
                          hintText: 'Enter Name of Recipient',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Lic no
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Licence Number"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: licNo,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.model_training,
                            color: Color(0xff8B5CF6),
                          ),
                          filled: true,
                          fillColor: Color(0xffE2E8F0),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Enter Licence number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //year of expiry
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Year of Expiry"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        readOnly: true,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                        controller: doe,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year,
                                DateTime.now().month - 1, DateTime.now().day),
                            lastDate: DateTime(DateTime.now().year + 5,
                                DateTime.now().month, DateTime.now().day),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: themcol,
                                    onSurface: themcol,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: themcol,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          doe.text = DateFormat("dd-MM-yyyy").format(date!);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xff8B5CF6),
                            ),
                            filled: true,
                            fillColor: Color(0xffE2E8F0),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Enter Expiry Year',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Select Services"),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: const Text(
                          "select services subtype",
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
                        value: stossub.value,
                        // icon: const Icon(
                        //   Icons.keyboard_arrow_down,
                        //   color: Colors.black,
                        //   size: 20,
                        // ),
                        items: [
                          for (int i = 0;
                              i < serviceList.value.length;
                              i++) ...[
                            DropdownMenuItem(
                                value: serviceList.value[i]["name"]!,
                                child: Text(
                                  serviceList.value[i]["name"]!,
                                  textScaleFactor: 1,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))
                          ]
                        ],
                        onChanged: (newValue) {
                          String myserviceid = "";
                          for (int i = 0; i < serviceList.value.length; i++) {
                            if (serviceList.value[i]["name"] == newValue) {
                              myserviceid = serviceList.value[i]["id"]!;
                            }
                          }

                          stossub.value = newValue;
                          docServiceId.value = int.parse(myserviceid);
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
                          if (name.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please enter your name")));
                          } else if (licNo.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please enter your licence number")));
                          } else if (doe.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Please enter year of expiry")));
                          } else if (stossub.value == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Fill all the fields")));
                          } else {
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
            if (isSubmit.value) ...[
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
                          "1. Fees Starts from Rs.${(double.parse(docData.value["fees"]) + double.parse(docData.value["commission"])).toString().split(".")[0]} on wards.",
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
                          "1. It's takes ${docData.value["minDay"]}-${docData.value["maxDay"]} days.",
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
