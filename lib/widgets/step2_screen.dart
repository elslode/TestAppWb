import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testappwb/bloc/form_flow_bloc.dart';

class Step2Screen extends StatelessWidget {
  const Step2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Шаг 2. Основные данные',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          BlocBuilder<FormFlowBloc, FormFlowState>(
              builder: (context, state) {
                return DropdownButtonFormField<String>(
                    initialValue: state.userType.isEmpty ? null : state
                        .userType,
                    decoration: const InputDecoration(
                      labelText: 'Ваш пол',
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: 'Woman',
                          child: Text('Женщина')
                      ),
                      DropdownMenuItem(
                          value: 'Man',
                          child: Text('Мужчина')
                      )
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<FormFlowBloc>()
                            .add(UserTypeChanged(value));
                      }
                    }
                );
              }
          ),

          const SizedBox(height: 16),

          BlocBuilder<FormFlowBloc, FormFlowState>(
            builder: (context, state) {
              return CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Я согласен с обработкой личных данных'),
                value: state.isAgreed,
                onChanged: (value) {
                  context
                      .read<FormFlowBloc>()
                      .add(AgreementToggled(value ?? false));
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
                    child: const Text('Назад')
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      context.read<FormFlowBloc>().add(NextStepPressed());
                    },
                    child: const Text('Вперед')
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
