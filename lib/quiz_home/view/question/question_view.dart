import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_supabase/quiz_home/bloc/quiz_bloc.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.question,
    required this.category,
  });

  final Question question;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Frage',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    question.questionText,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: question.options
                      .map(
                        (option) => QuestionOption(
                          option: option,
                          question: question,
                        ),
                      )
                      .toList(),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff88c0d0),),
                  ),
                  onPressed: () => _showBottomSheet(context,
                      context.read<QuizBloc>().state.selectedOption, question),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('Prüfen')],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [],
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    Option option,
    Question question,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(option.isCorrect ? 'Sehr gut!' : 'Falsch!'),
              Text(
                option.isCorrect
                    ? 'Die richtige Antwort ist '
                        '${question.options.firstWhere(
                              (option) => option.isCorrect,
                            ).text}'
                    : 'Versuche es nochmal!',
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: option.isCorrect ? Color(0xff88c0d0): Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Text(
                  option.isCorrect ? 'Weiter!' : 'Nochmal!',
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (option.isCorrect) {
                    context.read<QuizBloc>().add(const QuizNextPage());
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class QuestionOption extends StatelessWidget {
  const QuestionOption({
    super.key,
    required this.option,
    required this.question,
  });

  final Option option;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final state = context.read<QuizBloc>().state;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff44475a),
          width: 3,
        ),
      ),
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          context.read<QuizBloc>().add(QuizOptionSelected(option: option));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              if (state.selectedOption.text == option.text)
                const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              else
                const Icon(Icons.circle),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Text(option.text)),
            ],
          ),
        ),
      ),
    );
  }
}
