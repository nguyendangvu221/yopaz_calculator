import 'dart:async';
import 'package:math_expressions/math_expressions.dart';
import 'package:bloc/bloc.dart';
import 'package:yopaz_calculator/app/presentation/bloc/calculator_event.dart';
import 'package:yopaz_calculator/app/presentation/bloc/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<ChangeTextInputEvent>(_onChangeTextInputEvent);
    on<ChangeIsEqualEvent>(_onChangeIsEqualEvent);
  }

  FutureOr<void> _onChangeTextInputEvent(ChangeTextInputEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
      textInput: event.string,
    ));
  }

  String equalPressed() {
    try {
      String finaluserinput = state.textInput.join().replaceAll('x', '*').replaceAll('%', '* 0.01');
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      final answer = eval.toString();
      return double.parse(answer).toString();
    } catch (e) {
      return 'Error';
    }
  }

  FutureOr<void> _onChangeIsEqualEvent(ChangeIsEqualEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
      isEqual: event.isEqual,
    ));
  }
}
