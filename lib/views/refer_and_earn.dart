import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:share_plus/share_plus.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  List<Contact> contacts = [];

  getContact() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> con = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      for (var i = 0; i < con.length; i++) {
        if (con[i].phones.isNotEmpty &&
            con[i].phones.first.number.length >= 10) {
          //removing the spaces
          final data = con[i].phones.first.number.replaceAll(' ', '');
          con[i].phones.first.number = data;

          //filtring the number which one is more then 10
          if (con[i].phones.first.number.length > 10) {
            final data1 = con[i].phones.first.number.substring(
                con[i].phones.first.number.length - 10,
                con[i].phones.first.number.length);

            con[i].phones.first.number = data1;
          }

          //filtring the number which one start with 6 7 8 9
          if (con[i].phones.first.number[0] == "6" ||
              con[i].phones.first.number[0] == "7" ||
              con[i].phones.first.number[0] == "8" ||
              con[i].phones.first.number[0] == "9") {
            setState(() {
              contacts.add(con[i]);
            });
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff22C55E)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff22C55E)),
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 25,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "REFER VIA WHATSAPP",
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () async {},
          ),
        ),
      ),
      backgroundColor: const Color(0xff8B5CF6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Refer & Earn \u{20B9}150',
          textScaleFactor: 1,
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assest/images/gift.jpg")),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Refer via",
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.75)),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await Share.share("some text");
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.share,
                                  size: 25,
                                  color: Color(0xff71717A),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF3F4F6),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(
                                const ClipboardData(text: "3F4E5W"));
                          },
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    "Referral Code",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff475569),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "3F4E5W",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff475569),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    await Clipboard.setData(
                                        const ClipboardData(text: "Some text"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Copied to clipboard"),
                                      duration: Duration(seconds: 1),
                                    ));
                                  },
                                  child: const Icon(Icons.copy)),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      // Container(
                      //     padding: const EdgeInsets.all(20),
                      //     child: const Text(
                      //       "Your Referrals",
                      //       textScaleFactor: 1,
                      //       style: TextStyle(
                      //           fontSize: 20, fontWeight: FontWeight.w500),
                      //     )),
                      Expanded(
                          child: (contacts.isEmpty)
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffF3F4F6),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Text(
                                                contacts[index]
                                                    .phones
                                                    .first
                                                    .number
                                                    .toString(),
                                                textScaleFactor: 1,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                contacts[index].displayName,
                                                textScaleFactor: 1,
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ))
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
