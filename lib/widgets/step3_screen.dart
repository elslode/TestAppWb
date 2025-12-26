import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testappwb/bloc/form_flow_bloc.dart';

class Step3Screen extends StatefulWidget {
  const Step3Screen({super.key});

  @override
  State<Step3Screen> createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3Screen> {

  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();

    final state = context.read<FormFlowBloc>().state;

    _commentController = TextEditingController(text: state.comment);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormFlowBloc, FormFlowState>(
      listener: (context, state) {
        if (_commentController.text != state.comment) {
          _commentController.text = state.comment;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Шаг 3. Что нам важно знать?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            BlocBuilder<FormFlowBloc, FormFlowState>(
              builder: (context, state) {
                return TextField(
                  controller: _commentController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Коротко о себе',
                    alignLabelWithHint: true,
                  ),
                  onChanged: (value) {
                    context.read<FormFlowBloc>().add(CommentChanged(value));
                  },
                );
              },
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<FormFlowBloc>().add(PreviousStepPressed());
                    },
                    child: const Text('Назад'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<FormFlowBloc>().add(NextStepPressed());
                    },
                    child: const Text('Вперед'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



