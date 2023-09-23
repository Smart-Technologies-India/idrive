import 'package:carpage/views/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/questionanswer/queansstate.dart';
import '../../state/questionanswer/timerstate.dart';

class LessionPage extends HookConsumerWidget {
  const LessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queAnsStateW = ref.watch(queAnsState);

    return Scaffold(
      backgroundColor: const Color(0xffDDD6FE),
      appBar: AppBar(
        title: const Text("Lessons Page"),
        backgroundColor: const Color(0xff8B5CF6),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //Test
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => QuizPage(
                          title: "Driving Test Exam",
                          start: 0,
                          range: queAnsStateW.question.length,
                          sequence: 1,
                        )),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Color(0xff8B5CF6), offset: Offset(-3, 0)),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assest/images/learn_city.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, right: 5, bottom: 5, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Driving Test",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Total Questions: ${queAnsStateW.question.length}",
                            textScaleFactor: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const Text(
                            "Lession description: Driving Test Lessions",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            for (int i = 0; i < queAnsStateW.question.length ~/ 15; i++) ...[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => QuizPage(
                            title: "Basic Driving Test",
                            start: i,
                            range: 15,
                            sequence: 29,
                          )),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xff8B5CF6), offset: Offset(-3, 0)),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assest/images/learn_city.png",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(
                            top: 5, right: 5, bottom: 5, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lessons ${i + 1}",
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "Total Questions: 15",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              "Lessons description: Driving test lessons",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      )),
    );
  }
}

class QuizPage extends HookConsumerWidget {
  const QuizPage({
    super.key,
    required this.title,
    required this.start,
    required this.range,
    required this.sequence,
  });
  final String title;
  final int start;
  final int range;
  final int sequence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queansStateW = ref.watch(queAnsState);

    void init() {
      queansStateW.setRange(range);
      queansStateW.setStart(start);
      queansStateW.setSequence(sequence);
      queansStateW.setStartingQue();
    }

    useEffect(() {
      init();
      return null;
    }, []);

    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff3d4c9f),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                title,
                textAlign: TextAlign.left,
                textScaleFactor: 1,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            if (!queansStateW.startTest) ...[
              StartTest(
                title: title,
              )
            ],
            if (queansStateW.startTest && !queansStateW.endTest) ...[
              const CurrentQuestion(),
            ],
            if (queansStateW.endTest) ...[
              const ShowResult(),
            ],
          ],
        )),
      ),
    );
  }
}

class CurrentQuestion extends HookConsumerWidget {
  const CurrentQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queansStateW = ref.watch(queAnsState);
    final timerStateW = ref.watch(timerState);

    final width = MediaQuery.of(context).size.width;

    ref.listen(timerState, ((previous, TimerState next) {
      if (next.countDown == 0) {
        if (queansStateW.selectedAns == -1) {
          queansStateW.setSkip(queansStateW.skipedQuestion + 1);
        } else {
          queansStateW.setWrongAnswer(queansStateW.wrongAnswers + 1);
        }
        queansStateW.nextQuestion();
        queansStateW.setSelectedAns(-1);
        timerStateW.restartTimer();
      }
    }));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Question: ${(queansStateW.questionCompleted) + 1}/${queansStateW.range}",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${(queansStateW.questionCompleted) + 1}. ${queansStateW.question[queansStateW.currentQuestion]["que"]}",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.85),
                    fontWeight: FontWeight.w500),
              ),
              if (queansStateW.question[queansStateW.currentQuestion]["img"] !=
                  null) ...[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      queansStateW.question[queansStateW.currentQuestion]
                          ["img"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              const SizedBox(
                height: 15,
              ),
              for (int i = 0;
                  i <
                      queansStateW
                          .question[queansStateW.currentQuestion]["opt"].length;
                  i++) ...[
                InkWell(
                  onTap: () {
                    queansStateW.setSelectedAns(i);
                  },
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: (queansStateW.selectedAns == i)
                          ? Colors.green.withOpacity(0.1)
                          : Colors.white,
                      border: Border.all(
                        width: 1.5,
                        color: (queansStateW.selectedAns == i)
                            ? Colors.green
                            : Colors.black.withOpacity(0.25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${i + 1}. ${queansStateW.question[queansStateW.currentQuestion]["opt"][i]}",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: (queansStateW.selectedAns == i)
                                    ? Colors.green
                                    : Colors.black.withOpacity(0.65),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        (queansStateW.selectedAns == i)
                            ? const Icon(Icons.adjust_rounded,
                                color: Colors.green)
                            : Icon(Icons.circle_outlined,
                                color: Colors.black.withOpacity(0.65)),
                      ],
                    ),
                  ),
                )
              ],
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xff3d4c9f),
                          ),
                        ),
                        onPressed: () {
                          // log("${queansStateW.currentQuestion} = ${queansStateW.question[queansStateW.currentQuestion]["id"]}");
                          timerStateW.restartTimer();
                          queansStateW.setSkip(queansStateW.skipedQuestion + 1);
                          if (queansStateW.questionCompleted !=
                              (queansStateW.range - 1)) {
                            queansStateW.nextQuestion();
                            queansStateW.setSelectedAns(-1);
                          } else {
                            queansStateW.changeEndTest();
                          }
                        },
                        child: const Text(
                          "Skip",
                          textScaleFactor: 1,
                          style: TextStyle(color: Color(0xff3d4c9f)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff3d4c9f)),
                        onPressed: () {
                          if (queansStateW.selectedAns == -1) {
                            SnackBar snakbar = const SnackBar(
                                backgroundColor: Color(0xfff43f5e),
                                content: Text(
                                  "Please Select a Answer",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          } else {

                            timerStateW.restartTimer();
                            if (queansStateW.selectedAns ==
                                queansStateW
                                        .question[queansStateW.currentQuestion]
                                    ["ra"]) {
                              queansStateW
                                  .setRightAnswer(queansStateW.rightAnswer + 1);
                            } else {
                              queansStateW.setWrongAnswer(
                                  queansStateW.wrongAnswers + 1);
                            }

                            if (queansStateW.questionCompleted !=
                                (queansStateW.range - 1)) {
                              queansStateW.nextQuestion();
                              queansStateW.setSelectedAns(-1);
                            } else {
                              queansStateW.changeEndTest();
                            }
                          }
                        },
                        child: const Text(
                          "Next",
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                  color: Color(0xfff43f5e),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${queansStateW.wrongAnswers} Wrong",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                  color: Color(0xff22c55e),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${queansStateW.rightAnswer} Right",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${timerStateW.countDown} Sec",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowResult extends HookConsumerWidget {
  const ShowResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queansStateW = ref.watch(queAnsState);
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.app_registration),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Your result",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.15),
                thickness: 2,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      color: Colors.black.withOpacity(0.85),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Total Questions:",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      queansStateW.range.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green.withOpacity(0.85),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Correct:",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      queansStateW.rightAnswer.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.red.withOpacity(0.85),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Wrong :",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      queansStateW.wrongAnswers.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.skip_next_rounded,
                      color: Colors.orange.withOpacity(0.85),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Skip:",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      queansStateW.skipedQuestion.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3d4c9f)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okey")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StartTest extends HookConsumerWidget {
  const StartTest({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queansStateW = ref.watch(queAnsState);
    final timerStateW = ref.watch(timerState);
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xff3d4c9f).withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff3d4c9f), width: 2),
                ),
                child: const Icon(
                  Icons.sort,
                  color: Color(0xff3d4c9f),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Course Name",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "- $title",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xff3d4c9f).withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff3d4c9f), width: 2),
                ),
                child: const Icon(
                  Icons.task,
                  color: Color(0xff3d4c9f),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Question",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "- ${queansStateW.range}",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(color: Colors.black.withOpacity(0.2), thickness: 2),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Before you Start",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.85),
                fontWeight: FontWeight.w500),
          ),
          const CusListText(
            listtext: [
              "You must complete this test in one session - make sure your internet is reliable.",
              "1 mark awarded for a currect answer. Nonegative markign will be there for wrong answer.",
              "More you give the corriect answer more you get the point",
              "If you don't fall in this test you can reteke this test once more."
            ],
          ),
          SizedBox(
            width: width,
            child: Text(
              "All the best",
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.85),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3d4c9f)),
              onPressed: () {
                timerStateW.startTiimer();
                queansStateW.changeStartTest();
              },
              child: const Text(
                "Start Test",
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CusListText extends HookWidget {
  const CusListText({super.key, required this.listtext});
  final List<String> listtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < listtext.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("• ",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.w500)),
                Expanded(
                  child: Text(listtext[i],
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
