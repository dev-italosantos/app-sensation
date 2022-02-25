import 'package:app_quiz/core/core.dart';
import 'package:app_quiz/screens/challenge/widgets/answer/play_answer.dart';
import 'package:app_quiz/screens/challenge/widgets/quiz/create_quiz.dart';
import 'package:app_quiz/screens/home/home_controller.dart';
import 'package:app_quiz/screens/home/home_state.dart';
import 'package:app_quiz/shared/services/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/appbar/app_bar_widget.dart';
import 'widgets/level_button/level_ button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  final DatabaseServices _databaseServices = DatabaseServices();

  late Stream<QuerySnapshot> quizStream;
  late String quizId;

  @override
  void initState() {
    super.initState();

    _databaseServices.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });


    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifer.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Visão Geral",
                  ),
                  LevelButtonWidget(
                    label: "Notícias",
                  ),
                  LevelButtonWidget(
                    label: "Sintomas",
                  ),
                ],
              ),
              const SizedBox(height: 24),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: quizStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Row(
                          children: const [
                            Text("Loading"),
                            Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.darkGreen),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        final quizId = snapshot.data!.docs.toString();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayAnswer(quizId),
                          ),
                        );
                      },
                      child: Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: GridView.count(
                            childAspectRatio: 1.0,
                            crossAxisCount: 2,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0.0, 10.0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.network(
                                      data['quizImageUrl'],
                                      width: 80,
                                    ),
                                    const SizedBox(
                                      height: 24 / 2,
                                    ),
                                    Text(
                                      data['quizTitle'],
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data['quizDesc'],
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList()),
                      ),
                    );
                  }),
            ),

              const SizedBox(height: 24),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: AppColors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateQuiz(),
              ),
            );
          },
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}

class CardTest extends StatefulWidget {
  const CardTest({
    Key? key,
    required this.quizStream,
  }) : super(key: key);

  final Stream<QuerySnapshot<Object?>> quizStream;


  @override
  State<CardTest> createState() => _CardTestState();
}

class _CardTestState extends State<CardTest> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
