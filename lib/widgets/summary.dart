import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testappwb/bloc/form_flow_bloc.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FormFlowBloc, FormFlowState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    'Вся информация',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  _RowItem(title: 'Имя', value: state.name),
                  _RowItem(title: 'Email', value: state.email),
                  _RowItem(title: 'Пол', value: state.userType),
                  _RowItem(title: 'Согласен на обработку персональных данных', value: state.isAgreed.toString()),
                  _RowItem(title: 'Коротко о себе', value: state.comment),
                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<FormFlowBloc>()
                            .add(ResetFormPressed());
                      },
                      child: const Text('Повторить процесс'),
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}

class _RowItem extends StatelessWidget {

  final String title;
  final String value;

  const _RowItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value.isEmpty ? '-' : value),
          ),
        ],
      ),
    );
  }
}
