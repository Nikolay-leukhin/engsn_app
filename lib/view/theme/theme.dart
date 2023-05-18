import 'package:engsn_corected/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.sky,
    textTheme: TextTheme(
        headlineMedium: GoogleFonts.beVietnamPro(
            color: AppColors.black,
            fontSize: 35,
            fontWeight: FontWeight.w700
        ),
        labelSmall: GoogleFonts.puritan(
            color: AppColors.light,
            fontSize: 18,
            fontWeight: FontWeight.w400
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
        )
    )
);
