import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yopaz_calculator/app/common/color_common.dart';
import 'package:yopaz_calculator/app/common/data_app.dart';
import 'package:yopaz_calculator/app/presentation/bloc/calculator_bloc.dart';
import 'package:yopaz_calculator/app/presentation/bloc/calculator_event.dart';
import 'package:yopaz_calculator/app/presentation/bloc/calculator_state.dart';
import 'package:yopaz_calculator/app/presentation/widget/custom_element_keyboard.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider<CalculatorBloc>(
          create: (context) => CalculatorBloc(),
          child: BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) => Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'RAD',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                          ).fontFamily,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  controller: TextEditingController(text: state.textInput.isEmpty ? '' : state.textInput.join()),
                  style: TextStyle(
                    color: const Color(ColorCommon.primaryColor),
                    fontSize: 35,
                    fontFamily: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                    ).fontFamily,
                  ),
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.2),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                context.read<CalculatorBloc>().add(const ChangeTextInputEvent([]));
                              } else if (index == 16) {
                              } else if (index == 19) {
                                final answer = context.read<CalculatorBloc>().equalPressed();
                                List<String> textInput = List.from(state.textInput);
                                textInput.clear();
                                textInput.add(answer.toString());
                                context.read<CalculatorBloc>().add(ChangeTextInputEvent(textInput));
                                context.read<CalculatorBloc>().add(const ChangeIsEqualEvent(true));
                              } else if (index == 2) {
                                List<String> textInput = List.from(state.textInput);
                                if (textInput.isNotEmpty) textInput.removeLast();
                                context.read<CalculatorBloc>().add(ChangeTextInputEvent(textInput));
                              } else {
                                List<String> textInput = List.from(state.textInput);
                                textInput.add(DataElementCalculator.listElement[index]);
                                if (textInput.isNotEmpty && state.isEqual) {
                                  String text = textInput.last;
                                  final number = int.tryParse(text);
                                  if (number != null) {
                                    textInput.clear();
                                    textInput.add(text);
                                  }
                                  context.read<CalculatorBloc>().add(const ChangeIsEqualEvent(false));
                                }
                                context.read<CalculatorBloc>().add(ChangeTextInputEvent(textInput));
                              }
                            },
                            child: customElementKeyboard(
                              index: index,
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
