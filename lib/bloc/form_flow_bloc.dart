import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'form_flow_event.dart';

part 'form_flow_state.dart';

class FormFlowBloc extends Bloc<FormFlowEvent, FormFlowState> {
  FormFlowBloc() : super(FormFlowState.initial()) {
    on<FormFlowEvent>((event, emit) {
      on<NameChanged>(_onNameChanged);
      on<EmailChanged>(_onEmailChanged);
      on<UserTypeChanged>(_onUserTypeChanged);
      on<AgreementToggled>(_isAgreeChanged);
      on<CommentChanged>(_onCommentChanged);

      on<NextStepPressed>(_onNextStepPressed);
      on<PreviousStepPressed>(_onPreviousStepPressed);

      on<ResetFormPressed>(_onResetFormPressed);
    });
  }

  void _onNameChanged(NameChanged event, Emitter<FormFlowState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onEmailChanged(EmailChanged event, Emitter<FormFlowState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onUserTypeChanged(UserTypeChanged event, Emitter<FormFlowState> emit) {
    emit(state.copyWith(userType: event.userType));
  }

  void _isAgreeChanged(
    AgreementToggled event,
    Emitter<FormFlowState> emit,
  ) {
    emit(state.copyWith(isAgreed: event.isAgreed));
  }

  void _onCommentChanged(CommentChanged event, Emitter<FormFlowState> emit) {
    emit(state.copyWith(comment: event.comment));
  }

  void _onNextStepPressed(NextStepPressed event, Emitter<FormFlowState> emit) {
    if (state.currentStep < 3) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStepPressed(PreviousStepPressed event, Emitter<FormFlowState> emit) {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onResetFormPressed(ResetFormPressed event, Emitter<FormFlowState> emit) {
    emit(FormFlowState.initial());
  }
}
