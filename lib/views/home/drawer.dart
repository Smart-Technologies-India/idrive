
import 'package:carpage/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyDrawer extends HookWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> version = useState<String>("");

    void init() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      version.value = packageInfo.version;
    }

    useEffect(() {
      init();
      return null;
    }, []);
    final width = MediaQuery.of(context).size.width;
    final List drawertabs = [
      {
        "name": "Privacy",
        "icon": Icons.privacy_tip_outlined,
        "function": () => {},
      },
      {
        "name": "Contact",
        "icon": Icons.call,
        "function": () => {},
      },
      {
        "name": "Help",
        "icon": Icons.help,
        "function": () => {},
      },
      {
        "name": "Logout",
        "icon": Icons.logout,
        "function": () => {},
      },
      {
        "name": "Exit",
        "icon": Icons.exit_to_app_sharp,
        "function": () => {},
      },
    ];

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: width,
              decoration: const BoxDecoration(color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Karan Kumar",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "9385748573",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawertabs.length,
              itemBuilder: (context, index) {
                return DrawerTabs(
                  title: drawertabs[index]["name"],
                  icon: drawertabs[index]["icon"],
                  function: drawertabs[index]["function"],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "v ${version.value}",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTabs extends HookWidget {
  const DrawerTabs({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
  });
  final String title;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: primaryColor),
        borderRadius: BorderRadius.circular(0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () => function(),
        child: Row(
          children: [
            Icon(icon, color: primaryColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                textScaleFactor: 1,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
