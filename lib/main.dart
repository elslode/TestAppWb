import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testappwb/bloc/form_flow_bloc.dart';
import 'package:testappwb/screens/form_flow_screen.dart';

void main() {
  runApp(const TestAppWB());
}

class TestAppWB extends StatelessWidget {
  const TestAppWB({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormFlowBloc>(
      create: (_) => FormFlowBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FormFlowScreen(),
      ),
    );
  }
}
