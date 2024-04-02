import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.restartQuiz
  });

  final List<String> chosenAnswer;
  final Function restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'questions_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromARGB(255, 138, 255, 253),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {restartQuiz();},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: const Text(
                "Restart Quiz",
                style: TextStyle(
                  color: Color.fromRGBO(0, 166, 255, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
