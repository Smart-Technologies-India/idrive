import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HolidaysList extends HookWidget {
  const HolidaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isGaz = useState(true);

    List gaz = [
      {
        "name": "Republic Day",
        "day": "26 Januaary",
      },
      {
        "name": "Maha Shivratir",
        "day": "11 Januaary",
      },
      {
        "name": "Holi",
        "day": "29 March",
      },
      {
        "name": "Good Firday",
        "day": "2 April",
      },
      {
        "name": "Mahavir Jayanti",
        "day": "6 April",
      },
      {
        "name": "Gudi Padva",
        "day": "13 April",
      },
      {
        "name": "Ram Navami",
        "day": "21 April",
      },
      {
        "name": "Independence Day",
        "day": "15 August",
      },
      {
        "name": "Janmashtami",
        "day": "30 August",
      },
      {
        "name": "Ganesh Chaturthi",
        "day": "10 September",
      },
      {
        "name": "Mahatma Gandhi's Birthday",
        "day": "2 Otober",
      },
      {
        "name": "Diwali",
        "day": "4 November",
      },
      {
        "name": "Vikram Samvat New Year",
        "day": "6 November",
      },
      {
        "name": "Bhai Duj",
        "day": "6 November",
      },
      {
        "name": "Pratihar Sashthi",
        "day": "10 November",
      },
      {
        "name": "Liberation Day(Daman and Diu)",
        "day": "19 December",
      },
      {
        "name": "Christmas Day",
        "day": "19 December",
      },
    ];
    List opt = [
      {
        "name": "New Year's Day",
        "day": "1 January",
      },
      {
        "name": "Lohri",
        "day": "13 January",
      },
      {
        "name": "Maker Sankranti/Pongal",
        "day": "14 January",
      },
      {
        "name": "Guru Gobin Singh's Birthday",
        "day": "20 January",
      },
      {
        "name": "Basant Panchami/Sri Panchami",
        "day": "16 Febuary",
      },
      {
        "name": "Shivaji Jayanti",
        "day": "19 Feburay",
      },
      {
        "name": "Hazarat Ali's Birthday",
        "day": "26 February",
      },
      {
        "name": "Guru Ravidas's Birthday",
        "day": "27 February",
      },
      {
        "name": "Swami Dayananda Saraswati Jayanti",
        "day": "8 March",
      },
      {
        "name": "Holika Dahan",
        "day": "28 March",
      },
      {
        "name": "Easter Saturday",
        "day": "4 April",
      },
      {
        "name": "Mesadi(Bengal)/(Bahag Bihu(Assam))",
        "day": "14 April",
      },
      {
        "name": "Vaisakhi/Vishu",
        "day": "7 May",
      },
      {
        "name": "Guru Rabindranaths's Birthday",
        "day": "9 May",
      },
      {
        "name": "Budha Purnima",
        "day": "26 May",
      },
      {
        "name": "Rath Yatra",
        "day": "12 july",
      },
      {
        "name": "Id-ul-Ziba(Bakrid)",
        "day": "21 July",
      },
      {
        "name": "Muharram",
        "day": "19 Auguest",
      },
      {
        "name": "Onamor Thiru Onam Dav",
        "day": "21 August",
      },
      {
        "name": "Rakshabandhan",
        "day": "22 August",
      },
      {
        "name": "Janmashtami",
        "day": "30 August",
      },
      {
        "name": "Maharishi Valmiki's Birthday",
        "day": "20 October",
      },
      {
        "name": "Karaka Chaturthi(Karva Chouth)",
        "day": "24 October",
      },
      {
        "name": "Guru Nanak's Birthday",
        "day": "19 November",
      },
      {
        "name": "Guru Teg Bahadur's Martyrdom Day",
        "day": "24 November",
      },
      {
        "name": "Christmas Eve",
        "day": "24 December",
      },
    ];

    ValueNotifier<List> show = useState([]);

    useEffect(() {
      if (isGaz.value) {
        show.value = gaz;
      } else {
        show.value = opt;
      }
      return () {};
    }, [isGaz.value]);

    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3498db),
        centerTitle: true,
        title: const Text("HOLIDAYS LIST"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(
                    0xff2ecc71,
                  ),
                ),
                child: const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 75,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "HOLIDAYS LIST",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              textItem(width, "HOLIDAYS LIST"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isGaz.value = true;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: (isGaz.value)
                                ? const Color(0xfff39c12)
                                : const Color(0xfffacc15),
                          ),
                          child: const Text(
                            "Gazetted",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isGaz.value = false;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: (isGaz.value)
                                ? const Color(0xfffacc15)
                                : const Color(0xfff39c12),
                          ),
                          child: const Text(
                            "Optional",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < show.value.length; i++) ...[
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        show.value[i]["name"],
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.95),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${show.value[i]["day"]}, ${DateTime.now().year}",
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
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
            fontSize: 20,
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
