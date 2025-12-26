import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testappwb/bloc/form_flow_bloc.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    final state = context.read<FormFlowBloc>().state;

    _nameController = TextEditingController(text: state.name);
    _emailController = TextEditingController(text: state.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormFlowBloc, FormFlowState>(
      listenWhen: (previous, current) =>
          previous.name != current.name || previous.email != current.email,
      listener: (context, state) {
        if (_nameController.text != state.name) {
          _nameController.text = state.name;
        }
        if (_emailController.text != state.email) {
          _emailController.text = state.email;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Шаг 1. Давай познакомимся',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            BlocBuilder<FormFlowBloc, FormFlowState>(
              buildWhen: (previous, current) => previous.name != current.name,
              builder: (context, state) {
                return TextField(
                  decoration: const InputDecoration(labelText: 'Имя'),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    context.read<FormFlowBloc>().add(NameChanged(value));
                  },
                  controller: _nameController,
                );
              },
            ),

            const SizedBox(height: 16),

            BlocBuilder<FormFlowBloc, FormFlowState>(
              buildWhen: (previous, current) => previous.name != current.name,
              builder: (context, state) {
                return TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    context.read<FormFlowBloc>().add(EmailChanged(value));
                  },
                  controller: _emailController,
                );
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  context.read<FormFlowBloc>().add(NextStepPressed());
                },
                child: const Text('Далее'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
