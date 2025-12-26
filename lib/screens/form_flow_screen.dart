import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form_flow_bloc.dart';
import '../widgets/step1_screen.dart';
import '../widgets/step2_screen.dart';
import '../widgets/step3_screen.dart';
import '../widgets/summary.dart';

class FormFlowScreen extends StatelessWidget {
  const FormFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FormFlowBloc, FormFlowState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.currentStep,
              children: const [
                Step1Screen(),
                Step2Screen(),
                Step3Screen(),
                SummaryScreen(),
              ],
            );
          },
        ),
      ),
    );
  }
}