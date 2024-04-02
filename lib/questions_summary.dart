import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    questionIndexColor(data) {
      if (data['user_answer'] == data['correct_answer']) {
        return const Color.fromARGB(255, 0, 156, 159);
      } else {
        return const Color.fromARGB(255, 32, 41, 42);
      }
    }

    correctAnswerStatus(data) {
      if (data['user_answer'] == data['correct_answer']) {
        return "Your answer is correct!";
      } else {
        return data['correct_answer'];
      }
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final Color questionColor = questionIndexColor(data);
              final String correctAnswer = correctAnswerStatus(data);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: questionColor,
                    ),
                    child: Text(
                      ((data['questions_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['questions'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          correctAnswer,
                          style: const TextStyle(color: Colors.amberAccent),
                        ),
                        const SizedBox(height: 7)
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
