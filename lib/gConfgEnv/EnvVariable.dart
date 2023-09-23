// ignore_for_file: constant_identifier_names, file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String DOMAIN_CHECK = "bluelemontech.in";
const String GOOGLE_MAP_DOMAIN_CHECK = "maps.googleapis.com";
const String GOOGLE_MAP_API_URL = "https://maps.googleapis.com/maps/api/";
const String API_MAP_KEY = "AIzaSyB4gJ7yyA04UUQsA5KyBt_KMEp8OLRJyz8";
const String RAZOR_URL = "http://api.razorpay.com/v1/orders";
const String RAZOR_KEY = "rzp_live_CmZl6QPjXQxbVa";
const String RAZOR_SECRET = "73By4OriOCtyK2ezHQN2ncpV";
const String HEADER_ACCEPT = "application/json";
const String HEADER_CONTENT_TYPE = "application/x-www-form-urlencoded";
const String HEADER_AUTH = "developerKoChangeKaroKoi";
const String HEADER_BUILD_NO = "8";
const String HEADER_VERSION = "1.0.8";
const String HEADER_APP_TYPE = "iDriveIndia";
const String HEADER_APP_DOMAIN = "com.bluelemontech.chohan.idrive";

const String WEBSITE_URL = "http://www.idriveindia.com/";
const String BASE_URL =
    "https://bluelemontech.in/websites/idriveindia.com/app/api/api.php";

// const String BASE_URL = "http://localhost:80/app/api/api.php";

const String DELIVERY_CHART_PATH =
    "https://bluelemontech.in/websites/idriveindia.com/data/json/deliveryChart.json";
const String APP_BANNER_JSON =
    "https://bluelemontech.in/websites/idriveindia.com/data/json/app_banner.json";
const String UPLOAD_PATH =
    "https://bluelemontech.in/websites/idriveindia.com/app/uploads/";

const dynamic GET_HEADER = {
  "Accept": HEADER_ACCEPT,
  "OAuth": HEADER_AUTH,
  "version": HEADER_BUILD_NO
};

const dynamic GOOGLE_MAP_HEADER = {
  "Accept": HEADER_ACCEPT,
  "Content-Type": HEADER_ACCEPT
};

const dynamic POST_HEADER = {
  "Accept": HEADER_ACCEPT,
  "OAuth": HEADER_AUTH,
  "version": HEADER_BUILD_NO,
  "Content-Type": HEADER_CONTENT_TYPE
};

const List<dynamic> LOADING_MESSAGES = [
  {
    "Id": 1,
    "picUrl": null,
    "textMessage":
        "The world's first automobile was developed by Carl Benz in 1885. The top speed of the motor car was 16 km per hour. It had a one cylinder four-stroke engine installed horizontally on a specifically designed chassis. It was known as the Benz Patent Motorwagen",
    "status": 1
  },
  {
    "Id": 2,
    "picUrl": null,
    "textMessage":
        "In 1908, the Model T developed by Henry Ford became the first car available to the masses. This was a low-cost car. It cost around \$850 in 1908 and \$260 in 1925 (the reduction in the cost of the car was mainly because of the invention of the assembly line)",
    "status": 1
  },
  {
    "Id": 3,
    "picUrl": null,
    "textMessage":
        "First time in America and the world: the world's first electric traffic signal is put into place on the corner of Euclid Avenue and East 105th Street in Cleveland, Ohio, on 5th August in 1914. Also, the first center painted dividing line appeared in 1911, in Michigan; the first \"No Left Turn\" sign would debut in Buffalo, New York, in 1916; and left-hand drive became standard in American cars in 1908",
    "status": 1
  },
  {
    "Id": 4,
    "picUrl": null,
    "textMessage":
        "The first self-propelled vehicle–Cugnot Fardier—was made by Nicolas-Joseph Cugnot in 1769. It was a steam-powered tricycle",
    "status": 1
  },
  {
    "Id": 5,
    "picUrl": null,
    "textMessage":
        "The world's first IC engine–The Pyréolophore–was probably built by Nicephore Niepce in 1807. The inventor is also credited with the invention of photography",
    "status": 1
  },
  {
    "Id": 6,
    "picUrl": null,
    "textMessage":
        "Carl Benz applied for a patent for his \"vehicle powered by a gas engine\" on January 29, 1886. The patent application, bearing the number DRP - 37435 could also be referred as the birth certificate of the automobile. The patent application was registered with the German Imperial Patent Office in Berlin",
    "status": 1
  },
  {
    "Id": 7,
    "picUrl": null,
    "textMessage":
        "The world's first long-distance journey (from Mannheim in southern Germany to Pforzheim) in the history of the automobile was undertaken by Bertha Benz (wife of Carl Benz) and her two sons in August 1888",
    "status": 1
  },
  {
    "Id": 8,
    "picUrl": null,
    "textMessage":
        "There are an estimated 1.2 billion cars in the world today while there were only 500 million in 1986. According to a report released by a research house Bernstein, there will be a total of 2 billion cars on the planet by 2040",
    "status": 1
  },
  {
    "Id": 9,
    "picUrl": null,
    "textMessage":
        "An average car has 30,000 parts. About 9,770,000 cars were made in Japan in 2014. Of this total, Toyota made about 3,270,000 cars",
    "status": 1
  },
  {
    "Id": 10,
    "picUrl": null,
    "textMessage": "Almost 95% of a car's lifetime is spent parked",
    "status": 1
  },
  {
    "Id": 11,
    "picUrl": null,
    "textMessage":
        "Surprisingly, 80% of an average car is recyclable. In the U.S. alone, 12 million vehicles are recycled every year. Interestingly, automotive recycling is the 16th largest industry in the U.S.",
    "status": 1
  },
  {
    "Id": 12,
    "picUrl": null,
    "textMessage":
        "Almost 65% of the world's population drives on the right side of the road",
    "status": 1
  },
  {
    "Id": 13,
    "picUrl": null,
    "textMessage":
        "A crash typically happens within an average of three seconds after a driver is distracted. According to a source, texting while driving increases the chances of an accident by 23 times",
    "status": 1
  },
  {
    "Id": 14,
    "picUrl": null,
    "textMessage":
        "Driving a car with a standard or manual transmission is not an easy job for Americans. Note that more than 95% of the cars in the U.S. have automatic transmission. On the other hand, in Europe and Japan, more than 80 percent of cars sold have manual transmissions",
    "status": 1
  },
  {
    "Id": 15,
    "picUrl": null,
    "textMessage":
        "In 2013, white was the world's most favorite car color. According to an Australian study, white vehicles are 10% less likely to be involved in an accident. Moreover, cars that have mainstream colors are prone to theft more than those that have less popular colors",
    "status": 1
  },
  {
    "Id": 16,
    "picUrl": null,
    "textMessage":
        "In 2017, Tesla became the world's second most valuable car company",
    "status": 1
  },
  {
    "Id": 17,
    "picUrl": null,
    "textMessage":
        "In case of a crash or an impact, airbags inflate in just 30 milliseconds",
    "status": 1
  },
  {
    "Id": 18,
    "picUrl": null,
    "textMessage":
        "Astonishingly, by the mid-1960s, American made cars were delivered to retail buyers with an average 24 defects a unit, and many of these defects were safety related",
    "status": 1
  },
  {
    "Id": 19,
    "picUrl": null,
    "textMessage":
        "In 1980, Japan became the world's leading auto producer. However, currently, it is the world's third largest producer of cars (behind China and the US)",
    "status": 1
  },
  {
    "Id": 20,
    "picUrl": null,
    "textMessage":
        "Did you know that in 1982, the automobile industry provided one of every 6 jobs in the U.S ? Thus, the automobile industry became a key force for change in the 20th century America",
    "status": 1
  },
  {
    "Id": 21,
    "picUrl": null,
    "textMessage":
        "From 1909 to 1927, Ford built more than 15 million cars. Initially, the Model T took 12 hours for assembly. With the help of the assembly line technique, this amount of time was cut to 8 minutes for each car in 1913, and finally in 1927, during the last years of the production of the Model T, the factory was delivering a completely assembled car in just 24 seconds",
    "status": 1
  },
  {
    "Id": 22,
    "picUrl": null,
    "textMessage":
        "One of the world's most loved cars; the Volkswagen Beetle was sold 20 million and more units worldwide and was the most popular car of the 20th century",
    "status": 1
  },
  {
    "Id": 23,
    "picUrl": null,
    "textMessage":
        "The Toyota Corolla is the world's best selling car. The Corolla is sold over 150 countries and regions and the company sells 1 Corolla every 15 seconds. Since its launch in 1966, the company has sold more than 44.1 million of these cars and that is roughly equivalent to 20% of the company's overall sales",
    "status": 1
  },
  {
    "Id": 24,
    "picUrl": null,
    "textMessage": "It is a criminal offense to drive a dirty car in Russia",
    "status": 1
  },
  {
    "Id": 25,
    "picUrl": null,
    "textMessage":
        "According to a source, in the U.K, almost £70,000 is spent on fuel by the average motorist over their lifetime",
    "status": 1
  },
  {
    "Id": 26,
    "picUrl": null,
    "textMessage": "China produces almost a quarter of the world's total cars",
    "status": 1
  },
  {
    "Id": 27,
    "picUrl": null,
    "textMessage":
        "The word \"car\" comes from the Latin word \"carrus\" - a two-wheeled wagon",
    "status": 1
  },
  {
    "Id": 28,
    "picUrl": null,
    "textMessage":
        "New car smell is actually the smell of various volatile organic compounds that are used to manufacture the car. The smell is intoxicating and the manufacturers are adopting measure and techniques to get rid of this smell",
    "status": 1
  },
  {
    "Id": 29,
    "picUrl": null,
    "textMessage":
        "Toyota's first car factory (now the Honsha Plant) was built in Koromo-cho",
    "status": 1
  },
  {
    "Id": 30,
    "picUrl": null,
    "textMessage":
        "Almost three-quarters of the Rolls Royce cars ever produced are still on the road today",
    "status": 1
  },
  {
    "Id": 31,
    "picUrl": null,
    "textMessage":
        "Did you know that the Volkswagen group comprises twelve brands from seven European countries: Volkswagen Passenger Cars, Audi, SEAT, ŠKODA, Bentley, Bugatti, Lamborghini, Porsche, Ducati, Volkswagen Commercial Vehicles, Scania, and MAN",
    "status": 1
  },
  {
    "Id": 32,
    "picUrl": null,
    "textMessage":
        "Electric cars are not a new phenomenon. Thomas Davenport is credited with building the first practical electric vehicle — a small locomotive",
    "status": 1
  },
  {
    "Id": 33,
    "picUrl": null,
    "textMessage": "There are more cars than people in Los Angeles",
    "status": 1
  },
  {
    "Id": 34,
    "picUrl": null,
    "textMessage":
        "Ralph Teetor–the inventor of cruise control (also known as a speedostat or tempomat) was blind. He invented the cruise control in 1948",
    "status": 1
  },
  {
    "Id": 35,
    "picUrl": null,
    "textMessage":
        "In 1941, Henry Ford made a car out of soybeans. The car weighed 2000 lbs and had a tubular steel frame that had 14 plastic panels attached to it",
    "status": 1
  },
  {
    "Id": 36,
    "picUrl": null,
    "textMessage":
        "Did you know that headlamp is the term used for a device which is attached to the front of a vehicle to light the road ahead? And headlight is the term which refers to the beam of light produced and distributed by the device",
    "status": 1
  },
  {
    "Id": 37,
    "picUrl": null,
    "textMessage":
        "Three-point seat belts save one life every six seconds. Seat belts were invented by Volvo and were not patented so that the invention could be used for safety purposes by other car manufacturers as well",
    "status": 1
  },
  {
    "Id": 38,
    "picUrl": null,
    "textMessage":
        "The average cost of car ownership in the U.S. amounts to \$8,876 per year for a sedan car or an average car for that matter",
    "status": 1
  },
  {
    "Id": 39,
    "picUrl": null,
    "textMessage":
        "In 2012, Nevada became the first U.S. state to issue the license to self-driving cars. Self-driving cars are autonomous cars that can drive from point A to point B without a driver. They use maps and sophisticated technology to accomplish the task. Researchers agree that these cars could help reduce road accidents in the future",
    "status": 1
  },
  {
    "Id": 40,
    "picUrl": null,
    "textMessage":
        "Denmark is one of the most expensive countries in which to buy a new car. Denmark collects 150% tax on all new car purchases. However, according to a source, the country is recently looking to cut the tax rate to 100% for new vehicle purchases",
    "status": 1
  },
  {
    "Id": 41,
    "picUrl": null,
    "textMessage":
        "Interestingly, half of all the new cars sold in Norway are electric or hybrid",
    "status": 1
  },
  {
    "Id": 42,
    "picUrl": null,
    "textMessage":
        "After the initial introduction of cars in the American market, there was an intense competition between other manufacturers and Ford Motor Company. General Motors had to take a planned obsolescence of products between 1920 and 1930 so that they could build better cars that attracted customers",
    "status": 1
  },
  {
    "Id": 43,
    "picUrl": null,
    "textMessage":
        "Did you know that large cars are more profitable than small cars",
    "status": 1
  },
  {
    "Id": 44,
    "picUrl": null,
    "textMessage":
        "Wheels are an essential part of any automobile or motorized vehicle for that matter. Did you know that wheels were invented around 3500 B.C in Mesopotamia and surprisingly no one knows how they were invented ? However, initially, they were not used for transportation. It took 300 years after the invention of the wheels that someone realized they could be used to serve a larger purpose",
    "status": 1
  },
  {
    "Id": 45,
    "picUrl": null,
    "textMessage":
        "Did you know that how the world famous brand 'Mercedes' came into existence ? Interestingly, the name 'Mercedes' was adopted from the name of a customer's daughter 'Mercedes Jellinek'",
    "status": 1
  },
  {
    "Id": 46,
    "picUrl": null,
    "textMessage":
        "Benz and Mercedes were competitors until 1920. When these companies merged, the newly formed company started selling cars under the brand name 'Mercedes-Benz'",
    "status": 1
  },
  {
    "Id": 47,
    "picUrl": null,
    "textMessage":
        "The rubber used in the tires of a car is vulcanized. Vulcanization is a process for converting natural rubber or related polymers into more durable materials by heating them with sulfur or other equivalent curatives or accelerators. Charles Goodyear invented the process of vulcanization of rubber when he was in jail and was experimenting with a piece of rubber and a pin. He accidentally dropped the piece of the rubber on the hot stove and the rubber became black and tough",
    "status": 1
  },
  {
    "Id": 48,
    "picUrl": null,
    "textMessage":
        "Interestingly, the Beetle (from 1938 until 2003; total 21,529,464 units produced) came into existence when Adolf Hitler inspired by Henry Ford ordered the German carmaker, Dr. Ferdinand Porche, to develop a people's car or \"Volks Wagen\" called the KDF (Kraft durch Frende)",
    "status": 1
  },
  {
    "Id": 49,
    "picUrl": null,
    "textMessage":
        "Toyota, Daihatsu, Nissan, Suzuki, Mazda, Mitsubishi, Subaru, Isuzu, and Honda are all Japanese car makers. Honda is the first Japanese carmaker to open a plant in the U.S. in the early 1980s",
    "status": 1
  },
  {
    "Id": 50,
    "picUrl": null,
    "textMessage":
        "On 15 September 1938, the Railton Mobile Special is the first car in the history to go faster than 350 mph (563.27 km/h). After further development, On 16 September 1947, John Cobb was able to break 400 mph (640 km/h) in a measured test",
    "status": 1
  },
];

bool tryJsonDecode(String input) {
  try {
    if (input.runtimeType == Null ||
        input.isEmpty ||
        input.toString().trim().isEmpty ||
        input.toString().trim() == "null") {
      return true;
    } else {
      jsonDecode(input) as Map<String, dynamic>;
      return false;
    }
  } catch (e) {
    return true;
  }
}

Future<dynamic> getDeviceInfo() async {
  String deviceToken = "";
  Map<String, String> deviceData = {};
  String loggedInUserId = '0', loggedInContact = '0';
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('deviceToken', deviceToken);
  try {
    String? loginString = prefs.getString('login');
    if (loginString.runtimeType == Null ||
        loginString.toString().trim().isEmpty ||
        loginString.toString().trim() == "null" ||
        loginString.toString().trim() == "na") {
    } else {
      dynamic login = await jsonDecode(loginString!);
      if (login == null || login.runtimeType == Null) {
      } else {
        if (login['Id'] == null ||
            login['Id'].runtimeType == Null ||
            double.tryParse(login['Id'].toString()).runtimeType == Null) {
        } else {
          loggedInUserId =
              double.parse(login['Id'].toString()).toStringAsFixed(0);
        }
        if (login['contact'] == null ||
            login['contact'].runtimeType == Null ||
            double.tryParse(login['contact'].toString()).runtimeType == Null) {
        } else {
          loggedInContact =
              double.parse(login['contact'].toString()).toStringAsFixed(0);
        }
      }
    }
  } catch (exErr01) {}
  try {
    if (Platform.isAndroid) {
      await prefs.setString('platform', '2');
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      String buildSdkVersion = build.version.sdkInt.toString();
      String buildBrand =
          finalFormatReduced("${build.manufacturer},${build.brand}");
      String buildModel = finalFormatReduced(
          "${build.tags},${build.device},${build.type},${build.product},${build.board},${build.bootloader},${build.display},${build.hardware},${build.fingerprint},${build.model}");
      String buildAndroidId = finalFormatReduced("${build.device},${build.id}");
      deviceData = {
        'SdkVersion': buildSdkVersion,
        'Model': buildModel,
        'Device': buildAndroidId,
        'Brand': buildBrand,
        'Platform': '2',
        "Accept": HEADER_ACCEPT,
        "OAuth": HEADER_AUTH,
        "version": HEADER_BUILD_NO,
        "Content-Type": HEADER_CONTENT_TYPE,
        "LogInContact": loggedInContact,
        "LogInUserId": loggedInUserId,
        "LogInDeviceToken": deviceToken,
        "App": HEADER_APP_TYPE,
        "Package": HEADER_APP_DOMAIN,
        "AppVersion": HEADER_VERSION,
        "BuildVersion": HEADER_BUILD_NO,
      };
    } else if (Platform.isIOS) {
      await prefs.setString('platform', '1');
      IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      String dataModel = finalFormatReduced(
          "${data.utsname.machine},${data.utsname.sysname},${data.systemName}+${data.systemVersion},${data.localizedModel},${data.model},${data.name},${data.utsname.version}");
      String dataIdentifierForVendor = data.identifierForVendor.toString();
      deviceData = {
        'SdkVersion': data.systemVersion.toString(),
        'Model': dataModel.toString(),
        'Brand': 'iOS iPhone',
        'Device': dataIdentifierForVendor,
        'Platform': '1',
        "Accept": HEADER_ACCEPT,
        "OAuth": HEADER_AUTH,
        "version": HEADER_BUILD_NO,
        "Content-Type": HEADER_CONTENT_TYPE,
        "LogInContact": loggedInContact,
        "LogInUserId": loggedInUserId,
        "LogInDeviceToken": deviceToken,
        "App": HEADER_APP_TYPE,
        "Package": HEADER_APP_DOMAIN,
        "AppVersion": HEADER_VERSION,
        "BuildVersion": HEADER_BUILD_NO,
      };
    } else {
      deviceData = {
        "SdkVersion": '0',
        "Brand": 'na',
        "Model": 'na',
        "Device": 'na',
        "Platform": '0',
        "Accept": HEADER_ACCEPT,
        "OAuth": HEADER_AUTH,
        "version": HEADER_BUILD_NO,
        "Content-Type": HEADER_CONTENT_TYPE,
        "LogInContact": loggedInContact,
        "LogInUserId": loggedInUserId,
        "LogInDeviceToken": deviceToken,
        "App": HEADER_APP_TYPE,
        "Package": HEADER_APP_DOMAIN,
        "AppVersion": HEADER_VERSION,
        "BuildVersion": HEADER_BUILD_NO,
      };
    }
  } catch (exErr) {
    deviceData = {
      "SdkVersion": '0',
      "Brand": 'na',
      "Model": 'na',
      "Device": 'na',
      "Platform": '0',
      "Accept": HEADER_ACCEPT,
      "OAuth": HEADER_AUTH,
      "version": HEADER_BUILD_NO,
      "Content-Type": HEADER_CONTENT_TYPE,
      "LogInContact": loggedInContact,
      "LogInUserId": loggedInUserId,
      "LogInDeviceToken": deviceToken,
      "App": HEADER_APP_TYPE,
      "Package": HEADER_APP_DOMAIN,
      "AppVersion": HEADER_VERSION,
      "BuildVersion": HEADER_BUILD_NO,
    };
  }
  return deviceData;
}

String finalFormatReduced(String reFormattedString) {
  try {
    String ch = reFormatString(reFormattedString.toString())
        .split(' ')
        .toList()
        .where((String sec) => sec.isNotEmpty)
        .toList()
        .join(' ')
        .toString();
    return ((double.tryParse(ch).runtimeType == Null) ? ch : "");
  } catch (exErr) {
    return "";
  }
}

String reFormatString(String oldString) {
  try {
    String newString = "";
    if (oldString.runtimeType == Null ||
        oldString.isEmpty ||
        oldString.toString().trim().toLowerCase() == "null" ||
        oldString.toString().trim().toLowerCase() == "na") {
      oldString = newString;
    }
    oldString = (((oldString.toString()).split(',').join(' '))
            .trim()
            .split(' ')
            .join(','))
        .replaceAll("[^a-zA-Z0-9_.]+", ",")
        .replaceAll('\\r', '')
        .replaceAll('\\n', '')
        .replaceAll('\\', '')
        .toString();
    try {
      oldString = (((" $oldString ")
                  .split(RegExp(
                      r'(((\ )|(\,)|(\.))([a-z0-9A-Z\_\-]+)(\+)([a-z0-9A-Z\_\-]+)((\ )|(\,)|(\.)))'))
                  .join(" "))
              .replaceAll(
                  RegExp(
                    r'[^A-Za-z0-9!@#$%^&*\|\-\_\+\=\\\(\),./?\>\<:;\[\]\{\}]',
                  ),
                  ' ')
              .replaceAll(RegExp(r'(?:_|[^\w\s])+'), ' '))
          .trim();
    } catch (exErr) {}
    Set<String> seen = <String>{};
    newString = (((oldString).split(',').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    // seen = Set<String>();
    // newString = ((newString.toString().trim().split('.').toList())
    //     .where((str) => seen.add(str.toString().trim()))
    //     .toList())
    //     .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('+').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('!').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('@').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('#').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('\$').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('%').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('^').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('*').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('-').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    // seen = Set<String>();
    // newString = ((newString.toString().trim().split('_').toList())
    //     .where((str) => seen.add(str.toString().trim()))
    //     .toList())
    //     .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('=').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split(';').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split(':').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('?').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('|').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = (((" ${newString.toString().trim().toLowerCase()} ")
                .split(' null ')
                .toList())
            .where(
                (str) => seen.add(str.isNotEmpty ? str.toString().trim() : ""))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = (((" ${newString.toString().trim().toLowerCase()} ")
                .split(' na ')
                .toList())
            .where(
                (str) => seen.add(str.isNotEmpty ? str.toString().trim() : ""))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split(' ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('  ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('   ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('    ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('     ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('    ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('   ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split('  ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split(' ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    seen = <String>{};
    newString = ((newString.toString().trim().split(' ').toList())
            .where((str) => seen.add(str.toString().trim()))
            .toList())
        .join(" ");
    String res = stringCapitalize(newString.trim());
    return res;
  } catch (exErr) {
    return "";
  }
}

String stringCapitalize(String str) {
  try {
    String str1 = "";
    if (str.runtimeType == Null || str.isEmpty) {
      str = str1;
    }
    return (str).split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  } catch (exErr) {
    return "";
  }
}
