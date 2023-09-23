import 'package:flutter/material.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  TextEditingController? recipientName;
  TextEditingController? recipientDob;
  TextEditingController? name;
  TextEditingController? conNo;

  Color themcol = const Color(0xff8B5CF6);

  @override
  void initState() {
    super.initState();
    recipientName = TextEditingController();
    recipientDob = TextEditingController();
    name = TextEditingController();
    conNo = TextEditingController();
  }

  @override
  void dispose() {
    recipientName!.dispose();
    recipientDob!.dispose();
    name!.dispose();
    conNo!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text(
          "Licenses",
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
                      "Fill the name and DOB",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  //Recipient Name
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text(
                      "Enter Name of Recipient",
                      textScaleFactor: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: recipientName,
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
                            hintText: 'Enter name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  //Recipient Age
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Enter Age of Recipient"),
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
                        controller: recipientDob,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
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

                          recipientDob!.text = date.toString().substring(0, 10);
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
                            hintText: 'Enter Age',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  //user name
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Enter Name Name"),
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
                              horizontal: 20,
                              vertical: 15,
                            ),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  //user conteact number
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: const Text("Enter Name of Recipient"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: conNo,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff8B5CF6),
                          ),
                          filled: true,
                          fillColor: Color(0xffE2E8F0),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Enter your phone number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
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
                        style: ElevatedButton.styleFrom(backgroundColor: themcol),
                        child: const Text("Check Price"),
                        onPressed: () async {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
