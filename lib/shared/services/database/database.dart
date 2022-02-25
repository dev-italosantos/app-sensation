import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizId)
        .set(quizData)
        .then((value) => print("Quiz Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addQuestionData(Map<String, dynamic> questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizId)
        .collection('QNA')
        .add(questionData)
        .then((value) => print("Question Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  getQuizData() async {
    return await FirebaseFirestore.instance
        .collection('Quiz')
        .snapshots(includeMetadataChanges: true);
  }

  getQuestionData(String quizId) async{
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
