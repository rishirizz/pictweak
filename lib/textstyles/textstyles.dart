import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double getTextScaleFactor(BuildContext context) {
  return MediaQuery.of(context).textScaleFactor;
}

TextStyle headerTextStyle(BuildContext context) {
  return GoogleFonts.amaticSc(
    fontWeight: FontWeight.w600,
    fontSize: 35 * getTextScaleFactor(context),
  );
}

TextStyle primaryTextStyle(BuildContext context) {
  return GoogleFonts.openSans(
    fontSize: 18 * getTextScaleFactor(context),
  );
}

TextStyle floatingActionButtonTextStyle(BuildContext context) {
  return GoogleFonts.openSans(
    fontSize: 20 * getTextScaleFactor(context),
  );
}
