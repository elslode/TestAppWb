part of 'form_flow_bloc.dart';

abstract class FormFlowEvent extends Equatable {
  const FormFlowEvent();

  @override
  List<Object?> get props => [];
}

class NameChanged extends FormFlowEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class EmailChanged extends FormFlowEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class UserTypeChanged extends FormFlowEvent {
  final String userType;

  const UserTypeChanged(this.userType);

  @override
  List<Object?> get props => [userType];
}

class AgreementToggled extends FormFlowEvent {
  final bool isNeedToUpgradeSalary;

  const AgreementToggled(this.isNeedToUpgradeSalary);

  @override
  List<Object?> get props => [isNeedToUpgradeSalary];
}

class CommentChanged extends FormFlowEvent {
  final String comment;

  const CommentChanged(this.comment);

  @override
  List<Object?> get props => [comment];
}

//вперед
class NextStepPressed extends FormFlowEvent {}

//назад
class PreviousStepPressed extends FormFlowEvent {}

// сброс
class ResetFormPressed extends FormFlowEvent {}