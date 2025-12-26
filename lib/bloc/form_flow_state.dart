part of 'form_flow_bloc.dart';

class FormFlowState extends Equatable {
  final int currentStep;

  final String name;
  final String email;

  final String userType;
  final bool isAgreed;

  final String comment;

  const FormFlowState({
    required this.currentStep,
    required this.name,
    required this.email,
    required this.userType,
    required this.isAgreed,
    required this.comment,
  });

  factory FormFlowState.initial() {
    return const FormFlowState(
      currentStep: 0,
      name: '',
      email: '',
      userType: '',
      isAgreed: false,
      comment: '',
    );
  }

  FormFlowState copyWith({
    int? currentStep,
    String? name,
    String? email,
    String? userType,
    bool? isAgreed,
    String? comment,
  }) {
    return FormFlowState(
      currentStep: currentStep ?? this.currentStep,
      name: name ?? this.name,
      email: email ?? this.email,
      userType: userType ?? this.userType,
      isAgreed: isAgreed ?? this.isAgreed,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    name,
    email,
    userType,
    isAgreed,
    comment,
  ];

}
