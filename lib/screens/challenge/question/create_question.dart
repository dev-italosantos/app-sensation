import 'package:app_quiz/shared/services/database/database.dart';
import 'package:app_quiz/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateQuestion extends StatefulWidget {
  String quizId;

  CreateQuestion(this.quizId, {Key? key}) : super(key: key);

  @override
  _CreateQuestionState createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;

  DatabaseServices _databaseServices = DatabaseServices();

  bool _isLoading = false;

  uploadQuestionCreate() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      await _databaseServices.addQuestionData(questionMap, widget.quizId).then((value) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((e){
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _isLoading
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Question';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Question",
                      ),
                      onChanged: (value) {
                        question = value;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Option 1';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Option 1 (Correct Answer)",
                      ),
                      onChanged: (value) {
                        option1 = value;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Option 2';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Option 2",
                      ),
                      onChanged: (value) {
                        option2 = value;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Option 3';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Option 3",
                      ),
                      onChanged: (value) {
                        option3 = value;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Option 4';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Option 4",
                      ),
                      onChanged: (value) {
                        option4 = value;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    // TextFormField(
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Enter Option 5';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: const InputDecoration(
                    //     hintText: "Option 5",
                    //   ),
                    //   onChanged: (value) {
                    //     option5 = value;
                    //   },
                    // ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Button(
                            context: context,
                            label: "Submit",
                            buttonWidth:
                                MediaQuery.of(context).size.width / 2 - 36,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            uploadQuestionCreate();
                          },
                          child: Button(
                            context: context,
                            label: "Add Question",
                            buttonWidth:
                                MediaQuery.of(context).size.width / 2 - 36,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
