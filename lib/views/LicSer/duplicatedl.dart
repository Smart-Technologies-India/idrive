import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DuplicateDL extends HookWidget {
  const DuplicateDL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List> servicesName = useState([
      "Change in Name",
      "Change in Address",
      "Change in Number",
      "Change in Photo",
      "Chnage in DOB",
    ]);
    ValueNotifier<List> seriveValue =
        useState([false, false, false, false, false, false]);
    TextEditingController name = useTextEditingController();
    TextEditingController dob = useTextEditingController();

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

    useEffect(() {
      initList();
      return () {};
    }, []);

    Color themcol = const Color(0xff8B5CF6);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text(
          "Duplicate DL",
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
                      "Fill the Details",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  //your Name
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
                          hintText: 'Enter Name of Recipient',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //your dob
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Enter Your Date of Birth"),
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
                        controller: dob,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(DateTime.now().year - 18,
                                DateTime.now().month, DateTime.now().day),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(DateTime.now().year - 18,
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
                          dob.text = DateFormat("dd-MM-yyyy").format(date!);
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
                            hintText: 'Enter Year of Birth',
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
                    child: const Text(
                      "Select Services",
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  for (int i = 0; i < servicesName.value.length; i++) ...[
                    Card(
                      child: CheckboxListTile(
                        title: Text(servicesName.value[i]),
                        value: seriveValue.value[i],
                        onChanged: (val) {
                          seriveValue.value[i] = val;
                          seriveValue.value = [...seriveValue.value];
                          // for(int i = 0;i<seriveValue)
                        },
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
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
                                content: Text("Please Enter you Name"),
                              ),
                            );
                          } else if (dob.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please Enter Your Birth of Date"),
                              ),
                            );
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
            if (isSubmit.value && docData.value != 0) ...[
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
