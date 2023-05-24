import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.cherry,
    textTheme: TextTheme(
        headlineMedium: GoogleFonts.beVietnamPro(
            height: 0,
            color: AppColors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
        ),
        labelSmall: GoogleFonts.puritan(
            color: AppColors.light,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
        headlineSmall: GoogleFonts.beVietnamPro(
            color: AppColors.cherry,
            fontSize: 25,
            fontWeight: FontWeight.w600
        ),
        bodyMedium: GoogleFonts.puritan(
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400
        ),
        titleSmall: GoogleFonts.beVietnamPro(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1
        ),
      bodySmall: GoogleFonts.openSans(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600
      )
    )
);
