import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headingText({required String text}) {
  return Text(
    text,
    style: GoogleFonts.inter(
        fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
  );
}

Widget normalText(String text) {
  return Text(
    text,
    style: GoogleFonts.inter(fontSize: 18.sp, color: Colors.grey),
  );
}

Widget normalTextG(String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.grey),
  );
}

Widget devToSpace() {
  return SizedBox(
    height: 60,
  );
}
