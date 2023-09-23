import 'package:carpage/gConfgEnv/EnvVariable.dart';
import 'package:carpage/views/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:idrive/gConfgEnv/EnvVariable.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../../utils/app_colors.dart';
// import '../../widgets/custom_divider_view.dart';
// import '../home_bottom_navigation_screen.dart';
// import '../razor/payment/check.dart';

class CheckoutScreen extends StatefulWidget {
  final String totalFinalAmount;
  final String userFullAddress;
  final String agentName;
  final String serviceName;
  final String userName;
  final String userMob;
  final String userEmail;
  final String userId;
  final String orderId;
  final String razorOrderId;
  final dynamic razorNotes;
  const CheckoutScreen({
    Key? key,
    required this.totalFinalAmount,
    required this.userFullAddress,
    required this.userId,
    required this.orderId,
    required this.razorOrderId,
    required this.serviceName,
    required this.agentName,
    required this.userName,
    required this.userMob,
    required this.userEmail,
    required this.razorNotes,
  }) : super(key: key);
  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {
  int selectPayOption = 9;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onWillPop() async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (route) => false,
    );
    return false;
  }

  Color appColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Confirm Your Order',
            style: TextStyle(
              color: appColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: appColor,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Total Bill',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 17.0),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Text('To Pay (Rounded)',
                                  style: Theme.of(context).textTheme.titleSmall),
                              const Spacer(),
                              Text(
                                  'Rs. ${double.parse(widget.totalFinalAmount.toString()).ceil().toStringAsFixed(1)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // CustomDividerView(),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Order once placed cannot be cancelled and are non-refundable',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.red,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      // CustomDividerView(),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Communication Address',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 17.0),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              widget.userFullAddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                              textAlign: TextAlign.justify,
                              maxLines: 9,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      // CustomDividerView(),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Container(
                              child: Center(
                                child: Text(
                                  'Select Payment Option',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 17.0),
                                ),
                              ),
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          // : CustomDividerView(),
                          : Container(),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 3,
                              child: CheckboxListTile(
                                title: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/icons/creditcard.png',
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      Text('Credit Card',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                                value: (selectPayOption == 1),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue!) {
                                      selectPayOption = 1;
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .trailing, //  <-- leading Checkbox
                              ),
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 3,
                              child: CheckboxListTile(
                                title: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/icons/debitcard.png',
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      Text('Debit Card',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                                value: (selectPayOption == 2),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue!) {
                                      selectPayOption = 2;
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .trailing, //  <-- leading Checkbox
                              ),
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 3,
                              child: CheckboxListTile(
                                title: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/icons/netbanking.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      Text('Net / Mobile Banking',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                                value: (selectPayOption == 3),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue!) {
                                      selectPayOption = 3;
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .trailing, //  <-- leading Checkbox
                              ),
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 3,
                              child: CheckboxListTile(
                                title: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/icons/upi.png',
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      Text('UPI / Wallet / Other',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                                value: (selectPayOption == 4),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue!) {
                                      selectPayOption = 4;
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .trailing, //  <-- leading Checkbox
                              ),
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : const SizedBox(
                              height: 7,
                            ),
                      (double.parse(widget.totalFinalAmount.toString()) <= 0)
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 3,
                              child: CheckboxListTile(
                                title: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/icons/cod.png',
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      Text('Cash On Delivery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ],
                                  ),
                                ),
                                value: (selectPayOption == 9),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue!) {
                                      selectPayOption = 9;
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .trailing, //  <-- leading Checkbox
                              ),
                            ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectPayOption <= 0) {
                              Fluttertoast.showToast(
                                msg: 'Please Select Valid Pay Option',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: const Color(0xFFED2224),
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else if (selectPayOption == 9) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Appointment Submitted',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    ('Your appointment has been successfully registered, it will be processed as soon as possible. Appointment Reference No. #${widget.orderId}'),
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    maxLines: 9,
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Text(
                                        'Ok',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              var apiData2 = {
                                'f': 'updateOrder',
                                'Id': widget.orderId,
                                'paymentType': 'ONLINE',
                                'razorOrderId': widget.razorOrderId.toString(),
                                'paymentRef': 'RAZOR PAY',
                                'status': 'PAID',
                              };
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CheckRazor(
                              //       orderId: widget.razorOrderId.toString(),
                              //       notes: widget.razorNotes,
                              //       userName: widget.userName.toString(),
                              //       userContact: widget.userMob.toString(),
                              //       userEmail: widget.userEmail.toString(),
                              //       amount: (double.parse(widget
                              //               .totalFinalAmount
                              //               .toString()) *
                              //           100),
                              //       payDescription:
                              //           ('${widget.agentName}_${double.parse(widget.totalFinalAmount.toString()).ceilToDouble().toStringAsFixed(0)}_${widget.userMob}_${widget.userName}'),
                              //       apiData: apiData2,
                              //     ),
                              //   ),
                              // );
                            }
                          },
                          child: const Text(
                            'Place Order Now',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      // CustomDividerView(),
                      const SizedBox(
                        height: 7,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          launchUrl(Uri.parse("${WEBSITE_URL}contact/"));
                        },
                        child: const Text(
                          'Need Help',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
