import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:yopaz_calculator/app/common/color_common.dart';
import 'package:yopaz_calculator/app/common/data_app.dart';

Widget customElementKeyboard({
  required int index,
}) {
  if (index == 2 || index == 16) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          DataElementCalculator.listElement[index],
          // ignore: deprecated_member_use
          color: const Color(ColorCommon.primaryColor),
          width: 35,
        ),
      ),
    );
  } else if (index == 0 || index == 1 || index == 3 || index == 7 || index == 11 || index == 19 || index == 15) {
    return Container(
      color: index == 19 ? const Color(ColorCommon.primaryColor) : Colors.white,
      child: Center(
          child: Text(
        DataElementCalculator.listElement[index],
        style: TextStyle(
          fontSize: 35,
          color: index == 19 ? Colors.white : const Color(ColorCommon.primaryColor),
          fontFamily: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
          ).fontFamily,
        ),
      )),
    );
  } else if (index == 18) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
        DataElementCalculator.listElement[index],
        style: TextStyle(
          fontSize: 35,
          color: Colors.grey,
          fontFamily: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
          ).fontFamily,
        ),
      )),
    );
  } else {
    return Container(
      color: Colors.white,
      height: 50,
      width: 30,
      child: Center(
        child: Text(
          DataElementCalculator.listElement[index],
          style: TextStyle(
            fontSize: 35,
            color: Colors.grey,
            fontFamily: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
            ).fontFamily,
          ),
        ),
      ),
    );
  }
}
