import 'package:app_quiz/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayAnswer extends StatefulWidget {
  final String quizId;
  PlayAnswer(this.quizId);

  @override
  _PlayAnswerState createState() => _PlayAnswerState();
}

class _PlayAnswerState extends State<PlayAnswer> {

  @override
  void initState() {
    print("${widget.quizId}");
    super.initState();
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
    );
  }
}
