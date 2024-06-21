import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTextInputEvent extends CalculatorEvent {
  final List<String> string;
  const ChangeTextInputEvent(this.string);
  @override
  List<Object?> get props => [string];
}

class ChangeIsEqualEvent extends CalculatorEvent {
  final bool isEqual;
  const ChangeIsEqualEvent(this.isEqual);
  @override
  List<Object?> get props => [isEqual];
}
