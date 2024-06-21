import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final List<String> textInput;
  final bool isEqual;
  const CalculatorState({
    this.textInput = const [],
    this.isEqual = false,
  });

  CalculatorState copyWith({
    List<String>? textInput,
    bool? isEqual,
  }) {
    return CalculatorState(
      textInput: textInput ?? this.textInput,
      isEqual: isEqual ?? this.isEqual,
    );
  }

  @override
  List<Object?> get props => [
        textInput,
        isEqual,
      ];
}
