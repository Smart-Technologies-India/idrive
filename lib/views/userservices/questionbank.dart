import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/questionanswer/queansstate.dart';

class QuestionBank extends HookWidget {
  const QuestionBank({super.key});

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(initialLength: 2);

 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Question bank"),
        backgroundColor: const Color(0xff8B5CF6),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: const [
            Tab(
              text: "Q&A",
            ),
            Tab(
              text: "Traffic signs",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: const [
            QuestionAnswer(),
            TrafficSigns(),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswer extends HookConsumerWidget {
  const QuestionAnswer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queAnsStateW = ref.watch(queAnsState);

    ValueNotifier<List> myque = useState([]);

    void init() {
      for (int i = 0; i < queAnsStateW.question.length; i++) {
        if (queAnsStateW.question[i]["img"] == null) {
          myque.value = [...myque.value, queAnsStateW.question[i]];
        }
      }
    }

    useEffect(() {
      init();
      return null;
    }, []);

    return Container(
      color: const Color(0xfff3f4f6),
      child: ListView.builder(
        itemCount: myque.value.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "${index + 1}) ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: myque.value[index]["que"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textScaleFactor: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: "Ans. ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: myque.value[index]["opt"]
                            [myque.value[index]["ra"]],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textScaleFactor: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TrafficSigns extends HookConsumerWidget {
  const TrafficSigns({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queAnsStateW = ref.watch(queAnsState);

    return Container(
      color: const Color(0xfff3f4f6),
      child: ListView.builder(
        itemCount: queAnsStateW.question.length,
        itemBuilder: (context, index) {
          if (queAnsStateW.question[index]["img"] != null) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      queAnsStateW.question[index]["img"],
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Text(
                    "${queAnsStateW.question[index]["que"]}",
                    textScaleFactor: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "- ${queAnsStateW.question[index]["opt"][queAnsStateW.question[index]["ra"]]}",
                    textScaleFactor: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.85),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          }
        },
      ),
    );
  }
}
